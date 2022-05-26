{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images leaving the latest one",
            "selection": {
                "tagStatus": "any",
                "countType": "imageCountMoreThan",
                "countNumber": 2
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
