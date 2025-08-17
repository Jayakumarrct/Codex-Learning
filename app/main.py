import os
import tkinter as tk
from tkinter import filedialog, messagebox
from PIL import Image


def open_images():
    files = filedialog.askopenfilenames(
        title="Select Images",
        filetypes=[("Image files", "*.jpg *.jpeg *.jps *.png")]
    )
    if not files:
        return
    out_dir = filedialog.askdirectory(title="Select Output Folder")
    if not out_dir:
        return
    for f in files:
        try:
            with Image.open(f) as img:
                base = os.path.splitext(os.path.basename(f))[0]
                out_path = os.path.join(out_dir, base + ".eps")
                img.save(out_path, "EPS")
        except Exception as e:
            messagebox.showerror("Error", f"Failed to convert {f}: {e}")
            return
    messagebox.showinfo("Done", f"Converted {len(files)} file(s).")


def main():
    root = tk.Tk()
    root.title("Image to EPS")
    btn = tk.Button(root, text="Open Images...", command=open_images)
    btn.pack(padx=20, pady=20)
    root.mainloop()


if __name__ == "__main__":
    main()
