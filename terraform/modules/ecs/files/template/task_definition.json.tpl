[
    {
        "name": "streamlit",
        "image": "${REPOSITORY_URL}:latest",
        "command": [
            "streamlit", "run", "app.py"
        ],
        "cpu": 0,
        "essential": true,
        "logConfiguration": {
            "logDriver": "awslogs",
            "options": {
                "awslogs-group": "/aws/ecs/${SERVICE}-${ENV}-streamlit",
                "awslogs-region": "${REGION}",
                "awslogs-create-group": "true",
                "awslogs-stream-prefix": "ecs"
            }
        },
        "mountPoints": [],
        "portMappings": [
            {
                "hostPort": 8501,
                "protocol": "tcp",
                "containerPort": 8501
            }
        ],
        "environmentFiles": [],
        "environment": [],
        "secrets": [],
        "volumesFrom": []
    }
]
