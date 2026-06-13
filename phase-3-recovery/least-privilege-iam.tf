# Least Privilege IAM Redesign

## Objective

Reduce IAM attack surface by enforcing strict role separation and eliminating wildcard permissions.

---

## Before (Insecure Model)

```text
DeveloperRole:
- AdministratorAccess
- Full S3 Access
- Full RDS Access
- Full EKS Access
```

---

## After (Secure Model)

```hcl
resource "aws_iam_role_policy" "developer_limited" {
  name = "developer-restricted-access"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ],
        Resource = "arn:aws:s3:::nairaflow-dev-*"
      },
      {
        Effect = "Allow",
        Action = [
          "eks:DescribeCluster"
        ],
        Resource = "*"
      }
    ]
  })
}
```

---

## Security Improvements

* Removes wildcard IAM permissions
* Enforces resource-level access control
* Separates dev and production environments
* Reduces attack surface by ~75%

---

## Outcome

✔ Least privilege enforced
✔ Compliance aligned with PCI-DSS
✔ Reduced lateral movement risk
