#!/usr/bin/env python3
import asyncio
import csv
import os
from i3ipc.aio import Connection
from i3ipc import Event

CSV_PATH = os.path.expanduser("~/.config/i3/sizes.csv")

sizes = {}

if os.path.exists(CSV_PATH):
    with open(CSV_PATH) as f:
        for cls, w, h in csv.reader(f):
            sizes[cls] = (int(w), int(h))


def save_sizes():
    print("hello")
    with open(CSV_PATH, "w", newline="") as f:
        w = csv.writer(f)
        for cls, (ww, hh) in sizes.items():
            w.writerow([cls, ww, hh])


async def on_window(i3, e):
    con = e.container
    cls = con.window_class or con.app_id or con.name
    if not cls:
        return

    if e.change == "floating" and con.floating == "user_on":
        if cls in sizes:
            w, h = sizes[cls]
            print("RESTORING", cls, w, h)
        return

    if e.change == "floating" and con.floating == "user_off":
        x, y = con.rect.x, con.rect.y
        w, h = con.rect.width, con.rect.height
        print(x, y, w, h)
        sizes[cls] = (w, h)
        save_sizes()
        return


async def main():
    i3 = await Connection().connect()
    i3.on(Event.WINDOW, on_window)
    await i3.main()


if __name__ == "__main__":
    asyncio.run(main())

