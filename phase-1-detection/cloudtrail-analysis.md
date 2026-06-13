# CloudTrail Investigation Report

## Objective

Identify compromised IAM entities and reconstruct attacker activity using AWS CloudTrail logs in a forensic-safe manner.

---

## 1. Key Findings

### Suspicious IAM Activity Detected

* Multiple `AssumeRole` events from unusual IP ranges
* Access originating from developer IAM credentials outside normal working hours
* Privilege escalation attempts via policy attachment actions

---

## 2. High-Risk Events Identified

| Event Name        | Risk Level | Description                         |
| ----------------- | ---------- | ----------------------------------- |
| AssumeRole        | HIGH       | Cross-account / role abuse detected |
| CreateAccessKey   | CRITICAL   | New credential generation attempt   |
| AttachRolePolicy  | HIGH       | Privilege escalation attempt        |
| GetCallerIdentity | MEDIUM     | Reconnaissance activity             |
| ListBuckets       | MEDIUM     | Resource enumeration                |

---

## 3. Compromised Identity

**User:**

* `dev-engineering-user-03`

**Indicators of Compromise:**

* Login from Eastern Europe IP range
* Non-corporate user agent string
* Access outside normal developer working hours
* Unusual API call volume spike (x8 baseline)

---

## 4. CloudTrail Query Logic

```sql
index=aws_cloudtrail
eventName IN ("AssumeRole","CreateAccessKey","AttachRolePolicy")
| stats count by userIdentity.arn, sourceIPAddress, awsRegion
| sort -count
```

---

## 5. Attack Pattern Reconstruction

1. Initial access via compromised developer credentials
2. Enumeration of IAM roles
3. Privilege escalation attempts
4. Cross-environment access (staging → production)
5. Database access targeting RDS transaction store

---

## 6. Conclusion

The attacker leveraged valid IAM credentials rather than malware-based execution, indicating a **credential-based cloud intrusion (Living-off-the-land attack model)**.
