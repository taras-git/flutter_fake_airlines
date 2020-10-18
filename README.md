# flutterfakeairlines

A new Flutter application.

## Getting Started

This project is using a fake api calls from 
[instantwebtools](https://www.instantwebtools.net/fake-rest-api)

Example of a GET call:

```
https://api.instantwebtools.net/v1/passenger?page=0&size=10
```

Example of response:

```json
{
    "totalPassengers": 6,
    "totalPages": 6,
    "data": [
        {
            "_id": "5eef7f1bdfaf515ddc9feade",
            "name": "Saman Jeewantha",
            "trips": 500,
            "airline": [
                {
                    "id": 4,
                    "name": "Emirates",
                    "country": "Dubai",
                    "logo": "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Emirates_logo.svg/150px-Emirates_logo.svg.png",
                    "slogan": "From Dubai to destinations around the world.",
                    "head_quaters": "Garhoud, Dubai, United Arab Emirates",
                    "website": "www.emirates.com/",
                    "established": "1985"
                }
            ],
            "__v": 0
        }
    ]
}
```