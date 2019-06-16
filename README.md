# Autodesk license server container

Docker container to be used to serve Autodesk 2020 site license.

These details have been used for the license request from Autodesk.

Docker RUN command example:
docker run -d -p 2080:2080 -p 27000:27000 -h license-autodesk2020-1 --restart=always --mac-address="00-15-5D-03-D2-F7" 10.32.4.138:5000/flexlm-maya:2019
