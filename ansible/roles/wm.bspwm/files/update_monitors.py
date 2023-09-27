#!/usr/bin/env python3
import json
from os import environ
import subprocess
import time

import jinja2

CONFIG_DIR = environ.get("XDG_CONFIG_DIR") or f"{environ['HOME']}/.config"
EWW_CONFIG_PATH = f"{CONFIG_DIR}/eww/eww.yuck"

EWW_TEMPLATE_STR = """
(include "./layout.yuck")

{% for monitor in monitors %}
(defwindow {{ monitor }}
  :monitor "{{ monitor }}"
  :stacking "bg"
  :windowtype "dock"
  :reserve (struts :distance "3%" :side "top")
  :geometry (geometry :width "100%" :height "3%" :anchor "top center")
  (layout :monitor "{{ monitor }}"))

{% endfor %}
"""
EWW_TEMPLATE = jinja2.Template(EWW_TEMPLATE_STR)


def update_grid():
    subprocess.run(["bspwm-grid", "init"])


def update_eww(monitors: set[str]):
    rendered = EWW_TEMPLATE.render(monitors=monitors)
    with open(EWW_CONFIG_PATH, "w") as f:
        f.write(rendered)
    subprocess.run(["eww", "--restart", "open-many"] + list(monitors))
    # Hide eww when fullscreen
    time.sleep(1)
    fix_fullscreen(monitors)


def fix_fullscreen(monitors: set[str]):
    cmd = subprocess.run(["xdo", "id", "-n", "root"], capture_output=True)
    root_ids = cmd.stdout.decode("utf-8").splitlines()
    for monitor in monitors:
        # xdo above -t "$(xdo id -N Bspwm -n root | sort | head -n 1)" $(xdo id -n "eww-{monitor}")
        cmd = subprocess.run(["xdo", "id", "-n", f"eww-{monitor}"], capture_output=True)
        bar_id = cmd.stdout.decode("utf-8").strip()
        for root_id in root_ids:
            cmd = ["xdo", "above", "-t", root_id, bar_id]
            print(cmd)
            subprocess.run(cmd)


def update_monitors(monitors: set[str]):
    update_grid()
    update_eww(monitors)


def main():
    cmd = subprocess.Popen(["status-watcher", "monitor"], stdout=subprocess.PIPE)
    if cmd.stdout is None:
        print("I expected stdout to not be None!")
        exit(1)
    line = cmd.stdout.readline().decode("utf-8").strip()
    cmd.kill()
    monitors = set(json.loads(line))
    update_monitors(monitors)


if __name__ == "__main__":
    main()
