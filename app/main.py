import os
from tkinter import Tk, filedialog, messagebox, Button
from PIL import Image


def convert_images():
    filetypes = [
        ("Image files", "*.jpg *.jpeg *.jps *.png"),
        ("JPEG", "*.jpg *.jpeg *.jps"),
        ("PNG", "*.png"),
    ]
    paths = filedialog.askopenfilenames(title="Open Images", filetypes=filetypes)
    if not paths:
        return
    out_dir = filedialog.askdirectory(title="Choose Output Folder")
    if not out_dir:
        return

    for path in paths:
        try:
            img = Image.open(path)
            base = os.path.splitext(os.path.basename(path))[0]
            out_path = os.path.join(out_dir, f"{base}.eps")
            img.save(out_path, format="EPS")
        except Exception as exc:
            messagebox.showerror("Error", f"Failed to convert {path}: {exc}")
            return
    messagebox.showinfo("Done", "Conversion complete.")


def main():
    root = Tk()
    root.title("Image to EPS")
    Button(root, text="Open Images...", command=convert_images).pack(padx=20, pady=20)
    root.mainloop()


if __name__ == "__main__":
    main()
