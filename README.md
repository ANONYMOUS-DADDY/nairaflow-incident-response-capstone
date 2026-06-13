# nairaflow-incident-response-capstone
NIST SP 800-61 incident response capstone for a simulated AWS cloud breach
# NairaFlow Technologies – Incident Response Capstone

## Overview

This project documents the investigation, containment, and remediation of a multi-stage cloud security breach targeting NairaFlow Technologies’ AWS infrastructure. The incident involved compromised IAM credentials, lateral movement from staging to production, and attempted access to sensitive financial data.

The response follows the **NIST SP 800-61 Rev. 2 Incident Response Lifecycle** and aligns with **PCI-DSS v4.0** and **ISO 27001** requirements.

---

## Incident Summary

* Initial access via phishing attack targeting a developer workstation
* Credential theft of long-lived AWS IAM access keys
* Unauthorized use of AWS APIs via valid credentials
* Lateral movement from staging environment to production VPC
* Targeting of RDS database containing masked PII and transaction data
* Suspicious outbound traffic detected to known malicious IP

---

## Objectives

* Identify compromised IAM entities and scope of breach
* Preserve forensic evidence for legal and compliance purposes
* Contain attacker activity without disrupting production uptime (99.9% SLA)
* Eradicate persistence mechanisms
* Restore secure operations
* Implement long-term Zero Trust architecture improvements

---

## Response Framework

All activities are structured into three phases:

### Phase 1: Detection & Evidence Preservation

* CloudTrail and Splunk log correlation
* Identification of compromised IAM roles and access patterns
* Forensic snapshotting of EKS and RDS systems
* Evidence integrity preservation (PCI-DSS compliant chain of custody)

### Phase 2: Containment & Eradication

* IAM credential revocation and quarantine policies
* Okta session invalidation
* HashiCorp Vault secret rotation
* Network-level blocking of malicious IPs
* Kubernetes node isolation using cordoning

### Phase 3: Recovery & Hardening

* Implementation of least privilege IAM policies
* Network segmentation between staging and production
* Deployment of Kubernetes NetworkPolicies
* Transition to short-lived credentials and Zero Trust model

---

## Key Tools & Technologies

* AWS (EKS, RDS, S3, CloudTrail)
* Splunk Enterprise Security (SIEM)
* CrowdStrike Falcon (EDR)
* Okta Identity Management
* HashiCorp Vault
* Terraform (Infrastructure as Code)

---

## Success Metrics

* Zero confirmed data exfiltration
* Mean Time to Contain (MTTC) under 4 hours
* 100% credential rotation across systems
* 75% reduction in IAM permission scope
* Zero downtime to payment processing systems

---
Attack Flow Diagram 
Phishing Email
      ↓
Developer Workstation Compromise
      ↓
AWS IAM Credential Theft
      ↓
AssumeRole Abuse
      ↓
Staging Environment Access
      ↓
Production VPC Lateral Movement
      ↓
RDS Targeting (PII + Transactions)
      ↓
Outbound C2 Traffic Detected
      ↓
SIEM Alert → Incident Response Triggered
      ↓
Containment (IAM Quarantine + Token Revocation)
## Repository Structure

See `/phase-*` and `/reports` directories for full documentation, forensic analysis, and remediation plans.

---

## Author

Security Incident Response Capstone – NairaFlow Technologies Simulation

