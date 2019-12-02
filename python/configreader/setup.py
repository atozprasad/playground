import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="nsxt-api-configreader",  # Replace with your own username
    version="0.0.1",
    author="Prasad Challagandla",
    author_email="atozcareer@gmail.com",
    description="A small example package for NSXT API Configreader",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.6',
)
