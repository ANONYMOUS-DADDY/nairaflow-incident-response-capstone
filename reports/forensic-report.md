# Forensic Incident Report – NairaFlow Technologies

## 1. Executive Summary

A phishing-based compromise led to the exposure of AWS IAM credentials belonging to a developer account. The attacker leveraged these credentials to gain unauthorized access to AWS resources, move laterally from a staging environment into production, and attempt access to sensitive financial databases.

No confirmed data exfiltration occurred due to timely detection via SIEM alerts and containment actions.

---

## 2. Timeline of Events

| Time (UTC) | Event                                                |
| ---------- | ---------------------------------------------------- |
| 03:14      | SIEM alerts anomalous outbound traffic               |
| 03:16      | CloudTrail logs show suspicious AssumeRole activity  |
| 03:20      | IAM credential misuse confirmed                      |
| 03:28      | Lateral movement from staging to production detected |
| 03:35      | Incident response initiated                          |
| 03:44      | IAM quarantine policy applied                        |
| 03:55      | Okta sessions revoked                                |
| 04:10      | Vault secrets rotated                                |
| 04:30      | Attack containment confirmed                         |

---

## 3. Attack Vector Analysis

### Initial Access

* Phishing campaign targeting developer workstation
* Credential harvesting of AWS IAM access keys

### Persistence

* Use of long-lived IAM credentials
* No malware persistence due to EDR blocking execution

### Lateral Movement

* Abuse of over-permissive IAM roles
* Cross-environment access between staging and production VPC

### Exfiltration Attempt

* Outbound traffic to known malicious IP in Eastern Europe
* Attempted access to RDS transaction database

---

## 4. Affected Assets

* Developer IAM account (compromised)
* Staging EKS cluster
* Production VPC access paths
* RDS transaction database (access attempted)
* S3 buckets (enumeration observed)

---

## 5. Evidence Preserved

* AWS CloudTrail logs (immutable S3 storage)
* Splunk SIEM correlation logs
* Okta authentication logs
* EKS cluster audit logs
* RDS query logs
* VPC Flow Logs

Chain of custody was maintained throughout the response process.

---

## 6. Root Cause

1. Excessive IAM privileges (violating least privilege principle)
2. Lack of network segmentation between staging and production
3. Long-lived credentials instead of short-lived role-based access
4. Insufficient governance over IAM policy lifecycle

---

## 7. MITRE ATT&CK Mapping

* T1566 – Phishing
* T1078 – Valid Accounts
* T1059 – Command and Scripting Abuse
* T1021 – Remote Services
* T1041 – Exfiltration Over C2 Channel

---

## 8. Conclusion

The incident was successfully contained without confirmed data loss. However, it exposed critical weaknesses in IAM governance and network segmentation that must be addressed to achieve PCI-DSS and ISO 27001 compliance.
