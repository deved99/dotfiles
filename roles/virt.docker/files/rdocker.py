#!/usr/bin/env python3
import argparse
import json
import subprocess
from typing import List


def get_ids() -> list[str]:
    """Get ids of running containers from Docker.

    Returns:
      List of ids of running container, example:
      ['fcaa93ae9ed9', 'bbdd293805f3', '45685f60ae96', 'e4816f0bcb56', '12194d0ca40a']
    """
    cmd = ["docker", "ps", "-q"]
    p = subprocess.run(cmd, capture_output=True)
    # Exit on error
    if p.returncode != 0:
        print(p.stderr.decode("utf-8"))
        exit(p.returncode)
    return p.stdout.decode("utf-8").rstrip().split("\n")


class Container:
    name: str
    hostname: str
    image: str
    service: str
    project: str

    def __init__(self, data: dict):
        """Create a container from `docker inspect` output."""
        self.name = data["Name"]
        self.hostname = data["Config"]["Hostname"]
        self.image = data["Config"]["Image"]
        # Add info from labels
        labels = data["Config"]["Labels"]
        self.project = labels.get("com.docker.compose.project")
        self.service = labels.get("com.docker.compose.service")
        # If the container is not managed by Docker Compose, try with Docker Swarm
        if self.project is None:
            self.project = labels.get("com.docker.stack.namespace")
            raw_service = labels.get("com.docker.swarm.service.name")
            self.service = raw_service.replace(f"{self.project}_", "")

    def list():
        """Get running containers."""
        cmd = ["docker", "inspect"] + get_ids()
        p = subprocess.run(cmd, capture_output=True)
        # Exit on error
        if p.returncode != 0:
            print(p.stderr.decode("utf-8"))
            exit(p.returncode)
        dicts = json.loads(p.stdout.decode("utf-8"))
        return [Container(d) for d in dicts]

    def run(self, cmd: List[str]):
        cmd = ["docker", "exec", "-it", self.hostname] + cmd
        subprocess.run(cmd)

    def __str__(self):
        return f"{self.hostname} {self.name}"


class MatchedContainer:
    container: Container
    matches: str
    score: int

    def __init__(self, container: Container, matches: str):
        self.container = container
        self.matches = matches
        self.score = self.calculate_score()

    def calculate_score(self) -> int:
        c = 0
        container = self.container
        fields = [container.name, container.image, container.service, container.project]
        for field in fields:
            if self.matches in field:
                c += 1
        return c

    def __gt__(self, other):
        return self.score > other.score


def show(l: list):
    for i in l:
        print(i)


def select(l: list):
    """Select interactively from a list"""
    iterator = {f"{n} {v}": n for n, v in enumerate(l)}
    for i in iterator:
        print(i)
    # Now select
    choices = [str(i) for i in range(len(l))]
    while True:
        selection = input("Which one? ").strip()
        if selection == "":
            selection = 0
            break
        elif selection in choices:
            selection = int(selection)
            break
        else:
            print(f"Expected: {choices}\nFound: {selection}")
    return l[selection]


def main(name: str, cmd: list[str]):
    containers = Container.list()
    matched = [MatchedContainer(container, name) for container in containers]
    # Remove those with score=0
    matched = [c for c in matched if c.score > 0]
    matched.sort()
    # Get the ones with maximum score
    if matched == []:
        print("No container matched")
        exit(1)
    max_score = max([c.score for c in matched])
    matched_top = [c for c in matched if c.score == max_score]
    if len(matched_top) == 1:
        selected = matched_top[0].container
        show([c.container for c in matched])
        print(f"Chosen: {selected.hostname}\n")
        selected.run(cmd)
    else:
        container = select([c.container for c in matched])
        container.run(cmd)


def cli():
    parser = argparse.ArgumentParser()
    parser.add_argument("name")
    parser.add_argument("command", nargs="+")
    args = parser.parse_args()
    main(args.name, args.command)


if __name__ == "__main__":
    cli()
