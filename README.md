# NairaFlow Incident Response Capstone (NIST SP 800-61)

## 📌 Project Overview

This repository documents a full incident response simulation for a cloud-based FinTech environment (NairaFlow Technologies) under a multi-stage AWS IAM credential compromise.

The response follows:

* NIST SP 800-61 Rev. 2 Incident Response Lifecycle
* PCI-DSS v4.0 Compliance Requirements
* ISO 27001 Security Controls

---

## 📂 Repository Structure

```
phase-1-detection/      → CloudTrail analysis, Splunk investigation, forensic preservation
phase-2-containment/   → IAM quarantine, Okta session revocation, Vault rotation
phase-3-recovery/      → IAM hardening, Kubernetes NetworkPolicies, Zero Trust design
reports/               → Executive summary, forensic report, remediation roadmap
```

---

## 🚨 Incident Summary

A phishing-based attack compromised a developer AWS IAM credential, enabling unauthorized access to staging and production AWS environments. The attacker attempted lateral movement and access to RDS transaction data.

The incident was detected via SIEM alerts and successfully contained without confirmed data exfiltration.

---

## 🛠️ Key Technologies Used

* AWS (EKS, RDS, S3, CloudTrail)
* Splunk Enterprise Security (SIEM)
* Okta Identity Provider (IAM)
* HashiCorp Vault (Secrets Management)
* CrowdStrike Falcon (EDR)
* Terraform (Infrastructure as Code)

---

## 📊 Incident Response Methodology

All actions follow the NIST 4-phase lifecycle:

1. Preparation (existing controls review)
2. Detection & Analysis (CloudTrail + SIEM correlation)
3. Containment & Eradication (IAM isolation, token revocation)
4. Recovery & Post-Incident Hardening

---

## 🎯 Key Outcomes

* ✔ No confirmed data exfiltration
* ✔ MTTC under 4 hours
* ✔ 100% credential rotation achieved
* ✔ IAM attack surface reduced by 75%
* ✔ Production uptime maintained (99.9%)

---

## 📖 How to Evaluate This Project

1. Start with `reports/executive-summary.md`
2. Review `phase-1-detection/cloudtrail-analysis.md`
3. Follow incident timeline in `reports/forensic-report.md`
4. Validate containment actions in `phase-2-containment/`
5. Review hardening controls in `phase-3-recovery/`

---

## 🧠 Key Security Concepts Demonstrated

* IAM Least Privilege Enforcement
* Cloud Forensics & Evidence Preservation
* Kubernetes Micro-Segmentation
* Identity-Based Attack Containment
* Zero Trust Architecture Design
* PCI-DSS Incident Response Alignment

---

## 👨‍💻 Author

Security Incident Response Simulation – NairaFlow Technologies Capstone
