from setuptools import setup

APP = ['app/main.py']
OPTIONS = {
    'argv_emulation': True,
    'packages': ['PIL']
}

setup(
    name='Image to EPS',
    app=APP,
    options={'py2app': OPTIONS},
    setup_requires=['py2app'],
)
