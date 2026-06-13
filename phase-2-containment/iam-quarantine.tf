# IAM Quarantine & Containment Policy (Terraform)

## Objective

Immediately restrict all actions from compromised identities while preserving audit logs and production uptime.

---

```hcl
resource "aws_iam_policy" "quarantine_policy" {
  name        = "IAM-QUARANTINE-POLICY"
  description = "Emergency deny-all policy for compromised identities"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "DenyAllActions"
        Effect = "Deny"
        Action = "*"
        Resource = "*"
      }
    ]
  })
}
```

---

## Attachment Strategy

```hcl
resource "aws_iam_policy_attachment" "quarantine_attach" {
  name       = "attach-quarantine"
  users      = ["dev-engineering-user-03"]
  policy_arn = aws_iam_policy.quarantine_policy.arn
}
```

---

## Security Logic

* Implements immediate **identity isolation**
* Prevents further API calls from compromised credentials
* Maintains system uptime (no infrastructure shutdown required)
* Preserves forensic integrity

---

## Outcome

✔ Attacker access neutralized
✔ No production disruption
✔ Audit trail preserved
