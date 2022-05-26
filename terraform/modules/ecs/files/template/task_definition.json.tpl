[
    {
        "name": "${SERVICE}-${ENV}-streamlit-app",
        "image": "${REPOSITORY_URL}:latest",
        "cpu": 0,
        "essential": true,      
        "logConfiguration": {
            "logDriver": "awslogs",
            "options": {
                "awslogs-group": "/aws/ecs/${SERVICE}-${ENV}-streamlit-app",
                "awslogs-region": "${REGION}",
                "awslogs-create-group": "true",
                "awslogs-stream-prefix": "ecs"
            }
        },
        "mountPoints": [],
        "portMappings": [
            {
                "hostPort": 80,
                "protocol": "tcp",
                "containerPort": 80
            }
        ],
        "environmentFiles": [],
        "environment": [],
        "secrets": [],
        "volumesFrom": []
    }
]
