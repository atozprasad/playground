from setuptools import setup

with open("README.md", "r") as fh:
    long_description = fh.read()
setup(
    name="configreader",  # Replace with your own username
    version="0.0.2",
    author="Prasad Challagandla",
    author_email="atozcareer@gmail.com",
    description="A small example package for NSXT API Configreader",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="",
    packages=['configreader'],
    install_requires=['requests'],
    includie_package_data=True,
    license='MIT License',
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.0',
)
