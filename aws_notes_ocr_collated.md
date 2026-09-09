# AWS Cloud / AWS Certification Notes

> OCR/transcription of handwritten notes from the two uploaded scans.\
> The original terminology and note structure are preserved as closely
> as possible.\
> Where handwriting is genuinely unclear, it is marked as
> **\[unclear\]** rather than silently inventing content.

------------------------------------------------------------------------

# 1. AWS Short Key Points

## EC2

-   Security groups --- for EC2; act as a firewall.
    -   Can be attached to multiple instances.
    -   Can be attached to a region / VPC.
    -   All inbound traffic is blocked by default.
-   EC2 allows us to create a virtual machine using an EC2 instance.
-   EC2 instance connect --- connect to your EC2 instance without your
    own resources.
-   Instance purchasing options:
    -   **Reserved** --- reserve for a long workload.
    -   **Spot** --- unused EC2 capacity at a lower price; can be
        interrupted.
    -   **On-Demand** --- short-term / flexible usage.
    -   **EC2 Savings Plan** --- commit to a certain usage level and get
        a discount.
    -   **Dedicated Host** --- allows you to use your own physical
        server.
    -   **Dedicated Instance** --- server is dedicated to you.
-   EC2 capacity reservations --- reserve on-demand instances in a
    specific AZ for a duration; no time commitment, no billing
    \[unclear\].
-   EC2 usage data is used for bootstrapping.

## EBS / Storage

-   **EBS** --- block storage, mounted on a VM at a time; bound to a
    specific AZ.
-   **Snapshots** --- make a backup of EBS data at any point; can be
    copied across regions.
-   **AMI** --- Amazon Machine Image; a reusable template / image for
    EC2.
    -   AMI is regional.
-   **Image Builder** --- automate creation and maintenance of EC2 AMIs.
-   **Instance Store** --- high-speed local storage of an EC2 instance.
-   **EFS** --- file system; can be mounted on multiple EC2 instances
    across multiple AZs.
-   **EFS Infrequent Access** --- cost-optimized EFS storage tier.
-   **EFS** --- 3rd-party high-performance file system \[note says "FSX"
    and examples around it\].
-   **FSx for Lustre** --- high-performance computing (HPC), file
    system.
-   **LB** --- load balancer; distributes traffic across servers.
-   **ELB** --- managed load balancer by AWS.
    -   Application LB --- Layer 7 (HTTP/HTTPS).
    -   Network LB --- Layer 4 (TCP).
    -   Gateway LB --- Layer 3.
    -   Classic LB --- Layer 4/7.
-   **ASG** --- automatically scale up/down based on load.

------------------------------------------------------------------------

# 2. Amazon S3

## Basics

-   Object-based storage in buckets.
-   Key/value:
    -   Key = path
    -   Value = actual data / object.
-   IAM principal can access S3 only if an IAM policy allows it.
-   There is no explicit deny \[note\].

## S3 Versioning

-   Delete object → object becomes a delete marker.
-   Can get the object back by deleting the previous delete marker.

## S3 Storage Classes

-   **S3 Standard**
-   **S3 Intelligent-Tiering**
    -   Automatically moves objects between access tiers based on access
        patterns.
    -   Small monitoring/automation fee.
-   **S3 Standard-IA**
-   **S3 One Zone-IA**
-   **S3 Glacier Instant Retrieval**
-   **S3 Glacier Flexible Retrieval**
-   **S3 Glacier Deep Archive**

## S3 Pricing / Data Transfer Notes

-   AWS charges for data transfer out of S3.
-   Data transfer within the same region may be free \[as noted\].
-   Pricing depends on:
    -   storage
    -   requests
    -   data transfer
    -   retrieval, depending on storage class.

## S3 Storage Gateway

-   Bridges on-premises environments with AWS storage.
-   Types include file, volume and tape-oriented gateways.

------------------------------------------------------------------------

# 3. Databases

## Relational vs NoSQL

### Relational DB

-   Uses tables with rows and columns.
-   Tables can be related through keys.
-   Examples:
    -   **Amazon RDS**
    -   **Amazon Aurora**
    -   **Amazon Redshift**
    -   **Amazon Neptune** is not relational; it is a graph database.

### NoSQL

-   No fixed relational schema.
-   Flexible schema.
-   Uses key-value / document / other NoSQL models.
-   **DynamoDB** --- key-value database.
    -   Key-value store.
    -   Serverless / managed.
    -   Single-digit millisecond performance.
-   **DynamoDB Accelerator (DAX)** --- in-memory cache for DynamoDB.
-   **DynamoDB Global Tables** --- make DynamoDB tables accessible
    across regions.

### Other AWS Database Services

-   **Amazon Neptune** --- managed graph database.
-   **Amazon Timestream** --- serverless time-series database.
-   **Amazon ElastiCache** --- in-memory cache.
-   **Amazon DocumentDB** --- managed document database.
-   **Amazon QLDB** --- ledger database \[legacy/context from notes\].
-   **Amazon Redshift** --- data warehouse / analytics.
-   **Athena** --- serverless query service using SQL.
-   **QuickSight** --- serverless BI / visualization service.
-   **RDS** --- managed relational database service.
-   **DMS (Database Migration Service)** --- database migration service.

------------------------------------------------------------------------

# 4. Containers, Serverless & Developer Services

## Containers

-   Container = packaged environment containing an application and its
    dependencies.
-   Container image → used to create/run a container.
-   **ECS** --- launch/manage Docker containers on AWS.
-   **ECR** --- container registry; store Docker images.
-   **Fargate** --- serverless compute engine for containers.

## Serverless

-   **Lambda** --- run code without managing servers.
    -   Pay only when code runs.
    -   Charged for execution time.
-   **API Gateway** --- receive API requests and route/execute them.
-   **AWS Batch** --- managed batch computing jobs.
-   **Step Functions** --- build serverless workflows.
-   **EventBridge** --- event bus / event-driven architecture.
-   **CloudWatch** --- monitoring and observability.
-   **CloudTrail** --- records API activity / management events.

## Developer Tools

-   **AWS CodeCommit** --- Git repositories in AWS.
-   **AWS CodeBuild** --- build code.
-   **AWS CodeDeploy** --- deploy code.
-   **AWS CodePipeline** --- automate CI/CD pipeline.
-   **AWS CodeArtifact** --- package repository / package dependencies.
-   **Systems Manager (SSM)** --- manage EC2 and other AWS resources.
-   **AWS CodeGuru** --- application performance / code analysis.

------------------------------------------------------------------------

# 5. AWS Systems Manager

-   Helps manage EC2 and other AWS resources.
-   **Session Manager**:
    -   Provides secure shell/command access to EC2 without opening
        inbound SSH.
    -   No need to manage SSH keys.
-   **SSM Parameter Store**:
    -   Store configuration values and parameters securely.
-   **Patch Manager**:
    -   Patch/manage systems.
-   **Automation**:
    -   Automate operational tasks.

------------------------------------------------------------------------

# 6. Global Infrastructure / CloudFront / Route 53

## Global Accelerator

-   Uses AWS global network.
-   Routes users to optimal AWS endpoints.
-   Uses static IP addresses.
-   Improves availability and performance.

## CloudFront

-   CDN.
-   Caches content at edge locations.
-   Reduces latency for users.
-   Can serve content globally.

## CloudFront vs CRR

  -----------------------------------------------------------------------
  CloudFront                          Cross-Region Replication
  ----------------------------------- -----------------------------------
  Cache content at edge locations     Replicates S3 data to another AWS
                                      region

  Used for fast content delivery      Used for data redundancy / regional
                                      access

  Content may be cached               Actual object copy is replicated
  -----------------------------------------------------------------------

## S3 Transfer Acceleration

-   Speeds up uploads of large files to S3 from distant
    locations/regions.

## AWS Outposts

-   AWS infrastructure/service rack deployed on-premises.
-   Provides AWS services closer to the customer/on-prem environment.

## AWS Local Zones

-   Extensions of AWS Regions placed closer to end users.
-   Useful for workloads needing low latency.

## AWS Wavelength

-   Brings AWS compute/storage closer to 5G networks.

## SNS

-   Messaging service.
-   Publishes messages to many subscribers.
-   Enables decoupled applications.
-   Example: sending notifications.

## Kinesis

-   Processes real-time streaming data.
-   Example: analyze data as it arrives.

## Amazon MQ

-   Managed message broker service.
-   Useful when migrating traditional messaging systems.

## Amazon EventBridge

-   Event bus for connecting applications/services based on events.

------------------------------------------------------------------------

# 7. Monitoring, Logging & Operations

## CloudWatch

-   Monitor AWS resources and applications.
-   Metrics, logs, alarms and dashboards.
-   Can trigger actions based on thresholds.

## CloudTrail

-   Records AWS API activity.
-   Useful for auditing and investigating who did what.

## X-Ray

-   Distributed tracing / debugging.
-   Helps find performance bottlenecks in applications.
-   Helps trace requests across services.

## AWS Health Dashboard

-   Gives information about AWS service health and events affecting your
    resources.

## AWS Trusted Advisor

-   Provides recommendations for:
    -   cost optimization
    -   performance
    -   security
    -   fault tolerance / reliability
    -   service limits
    -   operational excellence \[as relevant\]

## AWS Compute Optimizer

-   Recommends optimal AWS resources based on workload usage.
-   Helps analyze resource sizing/configuration.

------------------------------------------------------------------------

# 8. AWS Well-Architected Framework

Six pillars:

1.  **Operational Excellence**
2.  **Security**
3.  **Reliability**
4.  **Performance Efficiency**
5.  **Cost Optimization**
6.  **Sustainability**

------------------------------------------------------------------------

# 9. Networking --- VPC

## VPC

-   Virtual Private Cloud.
-   Provides an isolated network in AWS.
-   Contains:
    -   subnets
    -   route tables
    -   security groups
    -   network ACLs
    -   gateways/endpoints.

## Subnets

-   VPC is divided into smaller subnets.
-   **Public subnet** --- has a route to the internet through an
    Internet Gateway.
-   **Private subnet** --- not directly reachable from the internet.

## Route Tables

-   Define where network traffic is sent.
-   Used for internal and external routing.

## Internet Gateway

-   Allows a VPC/subnet to communicate with the public internet when
    routes and public addressing are configured.

## NAT Gateway

-   Allows resources in private subnets to make outbound connections to
    the internet.
-   Does not allow unsolicited inbound internet connections to the
    private resources.

## Security Group

-   Stateful virtual firewall for EC2/network interfaces.
-   Controls inbound and outbound traffic.
-   Return traffic is automatically allowed.

## Network ACL

-   Stateless subnet-level firewall.
-   Has separate inbound and outbound rules.
-   Rules can explicitly allow or deny traffic.

## VPC Flow Logs

-   Record information about IP traffic flowing to/from network
    interfaces.
-   Useful for analyzing network traffic and troubleshooting.

## VPC Peering

-   Connects two VPCs privately.
-   Peered VPCs can communicate using private IP addresses.
-   No transitive peering.

## VPC Endpoint

-   Provides private connectivity from a VPC to supported AWS services.
-   Traffic does not need to traverse the public internet.

## AWS PrivateLink

-   Private access to services across VPCs/accounts.
-   Used to expose/access services without public internet access.

------------------------------------------------------------------------

# 10. VPN / Hybrid Connectivity

## Site-to-Site VPN

-   Creates an encrypted connection between an on-premises network and
    AWS.
-   Uses a VPN connection.

## AWS Client VPN

-   Connects individual users/devices to AWS/on-prem resources through a
    VPN.

## Direct Connect

-   Dedicated network connection between on-premises infrastructure and
    AWS.
-   More consistent/private connectivity than internet-based VPN.

## Transit Gateway

-   Central hub for connecting multiple VPCs and networks.
-   Simplifies large-scale network architecture.

## AWS Cloud WAN

-   Managed WAN service for connecting and managing global networks.

------------------------------------------------------------------------

# 11. DDoS Protection & Security

## AWS Shield

### Shield Standard

-   Basic DDoS protection.
-   Included automatically at no additional cost.

### Shield Advanced

-   Premium DDoS protection.
-   24/7 enhanced protection/support and additional features.

## AWS WAF

-   Web Application Firewall.
-   Filters HTTP/HTTPS requests.
-   Helps protect applications from:
    -   SQL injection
    -   XSS
    -   malicious requests
    -   unwanted web traffic.

## AWS Firewall Manager

-   Centrally manages security rules across multiple AWS accounts.
-   Useful for organization-wide security policies.

## Amazon GuardDuty

-   Threat detection.
-   Detects suspicious activity / anomalous behavior.

## Amazon Inspector

-   Automated security/vulnerability assessment.
-   Finds vulnerabilities in supported workloads.

## AWS Security Hub

-   Central place for security findings.
-   Aggregates security alerts/findings across AWS security services.

## Amazon Macie

-   Helps discover and protect sensitive data in Amazon S3.
-   Uses pattern matching / machine learning to identify sensitive
    information.

## AWS IAM

-   Identity and Access Management.
-   Controls who can access AWS resources and what they can do.

## IAM Access Analyzer

-   Helps identify resources that can be accessed externally.

------------------------------------------------------------------------

# 12. Encryption & Key Management

## AWS KMS

-   Managed key management service.
-   Creates/manages encryption keys used to protect data.

## CloudHSM

-   Hardware Security Module.
-   Dedicated hardware for cryptographic key storage/operations.
-   Customer-controlled HSM environment.

## AWS Secrets Manager

-   Stores and manages secrets such as passwords/API keys.
-   Can automatically rotate secrets.

## AWS Certificate Manager (ACM)

-   Manages SSL/TLS certificates.
-   Used to enable HTTPS for supported AWS services.

------------------------------------------------------------------------

# 13. Compliance & Governance

## AWS Artifact

-   On-demand access to AWS compliance reports and agreements.

### Artifact Reports

-   Compliance/security reports such as:
    -   PCI
    -   SOC
    -   ISO
    -   FedRAMP
    -   other compliance documentation.

### Artifact Agreements

-   Review and accept AWS agreements.

## AWS Audit Manager

-   Helps automate evidence collection for audits/compliance.

## AWS Config

-   Records/evaluates AWS resource configurations.
-   Helps check whether resources comply with desired rules.

## AWS Security Hub

-   Central security findings and posture view.

------------------------------------------------------------------------

# 14. AWS Organizations & Accounts

## AWS Organizations

-   Centrally manages multiple AWS accounts.
-   Consolidated billing.
-   Organizational Units (OUs).
-   Service Control Policies (SCPs).

## Service Control Policies (SCPs)

-   Set maximum permissions available to accounts/OUs.
-   Do not grant permissions by themselves.
-   Can restrict what member accounts can do.

## AWS Control Tower

-   Helps set up/govern a multi-account AWS environment.
-   Provides guardrails and account management.

## AWS Resource Access Manager (RAM)

-   Shares supported AWS resources across accounts.

------------------------------------------------------------------------

# 15. Pricing Models

1.  **Pay as you go**
    -   Pay only for what you use.
2.  **Save when you reserve**
    -   Commit for 1 or 3 years for discounted pricing.
3.  **Pay less by using more**
    -   Volume-based discounts.
4.  **Pay less as AWS prices go down**
    -   AWS may reduce prices as economies of scale improve.

------------------------------------------------------------------------

# 16. EC2 Pricing

-   **On-Demand**
    -   Pay for compute without long-term commitment.
-   **Reserved Instances**
    -   Discount for a commitment.
-   **Spot Instances**
    -   Use spare capacity at lower cost.
    -   Can be interrupted.
-   **Savings Plans**
    -   Commit to a certain amount of usage for discounted rates.
-   **Dedicated Hosts**
    -   Physical server dedicated to a customer.
-   **Dedicated Instances**
    -   Instances running on hardware dedicated to one customer.

------------------------------------------------------------------------

# 17. Billing & Cost Management

## Billing Tools

1.  **AWS Pricing Calculator**
    -   Estimate AWS cost before creating resources.
2.  **Billing Dashboard**
    -   View current/past AWS costs.
3.  **Cost Allocation Tags**
    -   Track costs by project/team/application.
4.  **AWS Budgets**
    -   Set cost/usage budgets and alerts.
5.  **Cost and Usage Report (CUR)**
    -   Detailed AWS usage and billing data.
6.  **Cost Explorer**
    -   Analyze and forecast AWS spending.
7.  **AWS Billing Conductor**
    -   Manage/show customized billing across accounts \[as noted\].

## AWS Budgets

-   Can create alerts based on:
    -   actual cost
    -   forecasted cost
    -   usage.

## Cost Anomaly Detection

-   Detects unusual spending patterns.

## Service Quotas

-   AWS service limits/quotas.
-   Can notify when usage approaches a quota threshold.

------------------------------------------------------------------------

# 18. Support Plans

## Basic Support

-   Billing support.
-   AWS documentation.
-   AWS Health Dashboard.
-   General service information.

## Developer Support

-   Technical support through email.
-   Business-hours support / core checks \[as noted\].

## Business Support

-   24/7 technical support.
-   Phone/email/chat.
-   Trusted Advisor access/features.
-   Faster response times.

## Enterprise On-Ramp

-   Mid-sized organizations.
-   Faster response times.
-   Guidance and more proactive support.

## Enterprise Support

-   Technical Account Manager.
-   Concierge support.
-   More comprehensive support.
-   Designed for large/critical environments.

------------------------------------------------------------------------

# 19. Identity Services

## AWS IAM

-   Users, groups, roles and policies.
-   Controls AWS access.

## Amazon Cognito

-   Identity service for web/mobile applications.
-   User sign-up/sign-in and federation.

## IAM Identity Center

-   Centralized workforce access / SSO to multiple AWS accounts and
    applications.

## AWS Directory Service

-   Managed directory services.

## AWS Managed Microsoft AD

-   Managed Microsoft Active Directory.

## AWS IAM Identity Center / SSO

-   One login for multiple AWS accounts/apps.

------------------------------------------------------------------------

# 20. Other AWS Services

## AWS AppStream

-   Stream applications to users.
-   Provides application streaming without requiring the full app
    installed locally.

## AWS IoT Core

-   Connects IoT devices to AWS cloud services.

## AWS AppSync

-   Managed GraphQL API service.
-   Useful for syncing data between apps and backend services.

## AWS Amplify

-   Tools/services for building and deploying web/mobile applications.

## AWS Serverless Application Repository

-   Repository for serverless applications/components.

## AWS Backup

-   Centralized backup service across AWS services.
-   Supports scheduled/on-demand backups.

## AWS Elastic Disaster Recovery

-   Disaster recovery service.
-   Continuously replicates servers and helps recover applications in
    AWS.

## AWS DataSync

-   Moves/synchronizes data between on-premises storage and AWS.
-   Useful for large-scale data transfers.

## AWS Application Discovery Service

-   Collects information about on-premises applications/resources to
    help with migration planning.

## AWS Application Migration Service (MGN)

-   Helps migrate applications/servers into AWS.

## AWS Mainframe Modernization

-   Tools/services for modernizing and migrating mainframe applications.

## AWS Application Composer

-   Visual tool for designing/building serverless applications.

## AWS Service Catalog

-   Create, manage and govern approved catalogs of AWS resources.

## AWS RAM

-   Share AWS resources across accounts.

------------------------------------------------------------------------

# 21. AWS AI / ML Services

## Amazon Rekognition

-   Image/video analysis.
-   Object/face/content detection.

## Amazon Transcribe

-   Speech-to-text.

## Amazon Polly

-   Text-to-speech.

## Amazon Translate

-   Language translation.

## Amazon Lex

-   Conversational AI / chatbots.
-   Voice and text interfaces.

## Amazon Comprehend

-   NLP service.
-   Finds insights/relationships in text.

## Amazon SageMaker AI

-   Managed service for developers/data scientists to build, train and
    deploy ML models.

## Amazon Kendra

-   Intelligent enterprise search.

## Amazon Personalize

-   Build personalized recommendations.

## Amazon Textract

-   Extracts text and structured information from documents.

------------------------------------------------------------------------

# 22. AWS Organizations / Governance Notes

## Management Account

-   Organization management/root account.
-   Manages multiple AWS accounts.

## Organizational Units (OUs)

-   Group AWS accounts.
-   Apply policies/controls to groups of accounts.

## SCP

-   Security/policy guardrail.
-   Restricts what accounts can do.
-   Example: if an action is denied by an SCP, the account cannot use
    that action even if an IAM policy grants it.

## Control Tower

-   Easier way to establish and govern a multi-account AWS environment.
-   Provides guardrails and account provisioning.

------------------------------------------------------------------------

# 23. Cloud Adoption / Migration

## Cloud Migration Strategies

1.  **Rehost**
    -   Move applications with minimal changes.
2.  **Replatform**
    -   Make some optimizations while moving.
3.  **Repurchase**
    -   Replace the existing product with a cloud/SaaS product.
4.  **Refactor / Re-architect**
    -   Redesign the application for cloud-native architecture.
5.  **Retain**
    -   Keep the application where it is.
6.  **Retire**
    -   Decommission applications that are no longer needed.

------------------------------------------------------------------------

# 24. AWS Cloud Adoption Framework (CAF)

Six perspectives:

1.  **Business**
2.  **People**
3.  **Governance**
4.  **Platform**
5.  **Security**
6.  **Operations**

Domains noted: - Technology - Process - Organization - Product

------------------------------------------------------------------------

# 25. Well-Architected Framework --- Additional Notes

The notes list:

-   Operational Excellence
-   Security
-   Reliability
-   Performance Efficiency
-   Cost Optimization
-   Sustainability

A Well-Architected review is used to evaluate whether workloads follow
AWS architectural best practices.

------------------------------------------------------------------------

# 26. Real-World / Scenario Questions

## Scenario 1 --- Snowball Edge → S3

**Question:** Transfer data from a Snowball Edge device to S3.

-   Snowball Edge can be used for large-scale data transfer.
-   The destination is Amazon S3.

## Scenario 2 --- Inspector

**Question:** Assess applications / scan EC2 for vulnerabilities and
security best practices.

-   **Amazon Inspector**

## Scenario 3 --- AWS Storage Gateway

**Question:** Connect on-premises storage to AWS while keeping low
latency.

-   **AWS Storage Gateway**

## Scenario 4 --- Service Catalog

**Question:** Create, manage and govern approved collections of AWS
resources.

-   **AWS Service Catalog**
-   Can be defined as Infrastructure as Code (IaC) \[as noted\].

------------------------------------------------------------------------

# 27. Practice Test Notes

## Questions / Answers

### Q18

**Q:** Ops Hub is a console to manage Snowball?\
**A:** AWS OpsHub is a console/utility for managing Snowball devices.

### Q19

**Q:** QuickSight\
**A:** Interactive dashboards / BI.

### CodeArtifact

-   Stores software packages and dependencies.

### AZ traffic

-   All traffic between Availability Zones is encrypted \[as noted\].

### AWS Wavelength

-   Delivered globally \[as noted\].

### Savings Plan

-   **Compute Savings Plan**
-   **EC2 Savings Plan**

------------------------------------------------------------------------

# 28. Disaster Recovery (DR)

## DR Strategies

### 1. Backup & Restore

-   Low cost.
-   Cheapest option.
-   Data can be restored after a failure.
-   Higher recovery time.

### 2. Pilot Light

-   Replicate data to another region.
-   Core components/data are already available.
-   Scale/start remaining resources when needed.

### 3. Warm Standby

-   Small working copy of the application is already running.
-   Scale it up during a disaster.

### 4. Multi-Site / Hot Standby

-   Two full environments run simultaneously.
-   Provides very low recovery time.

------------------------------------------------------------------------

# 29. Amazon Inspector / OpsHub / Other Practice Notes

-   **Amazon Inspector** --- assess applications and scan EC2 for
    vulnerabilities.
-   **AWS OpsHub** --- GUI/console for managing Snowball devices.
-   **AWS Storage Gateway** --- connects on-premises storage with AWS.
-   **AWS Service Catalog** --- create/manage/govern approved
    collections of AWS resources.
-   **AWS Well-Architected Framework** --- helps use cloud resources in
    ways that meet system requirements.

------------------------------------------------------------------------

# 30. AWS Architecture / Design Notes

## AWS Architecture Center

-   Provides reference architectures and architecture solutions.

## AWS Architecture diagrams

-   Used to design and communicate AWS architectures.

------------------------------------------------------------------------

# 31. AWS WAF Notes

-   WAF can be used with:
    -   **CloudFront**
    -   **Application Load Balancer (ALB)**
    -   **API Gateway**
    -   **AWS AppSync**
-   Management events are logged by CloudTrail by default.

------------------------------------------------------------------------

# 32. CloudEndure Disaster Recovery

-   Marketplace-based DR solution.
-   Continuously replicates server-hosted applications.
-   Used for disaster recovery.

------------------------------------------------------------------------

# 33. Security / Logging

## Detective Controls

Can involve:

-   CloudTrail logs
-   VPC Flow Logs
-   GuardDuty findings

These can be used to detect suspicious activity and investigate
incidents.

## Automatic Encryption

Notes list:

-   CloudTrail logs
-   S3 Glacier
-   Storage Gateway

------------------------------------------------------------------------

# 34. AWS CloudFormation

-   Infrastructure as Code.
-   Used to define and deploy AWS resources using templates.
-   Helps automate infrastructure provisioning.

------------------------------------------------------------------------

# 35. Amazon MQ vs EventBridge / Messaging

-   **Amazon MQ** --- managed message broker, useful for
    existing/traditional messaging applications.
-   **EventBridge** --- event bus for event-driven architectures.
-   **SNS** --- pub/sub messaging and fan-out.
-   **SQS** --- queueing service for decoupling applications \[concept
    referenced by the notes\].

------------------------------------------------------------------------

# 36. Serverless / Application Architecture

## Step Functions

-   Build serverless workflows.
-   Coordinate multiple steps/services.

## EventBridge

-   Connect applications through events.

## Lambda

-   Execute code without managing servers.
-   Pay for execution.

## API Gateway

-   API front door.
-   Receives API requests and routes them to backend services.

------------------------------------------------------------------------

# 37. AWS Market / Partner Ecosystem

## AWS Marketplace

-   Marketplace for AWS-compatible third-party software and solutions.

## AWS Partner Network (APN)

-   AWS partner ecosystem.

### APN Technology Partners

-   Provide hardware/software that works with AWS.

### APN Consulting Partners

-   Help customers build/migrate/manage solutions on AWS.

### APN Training Partners

-   Provide AWS training.

## AWS Managed Service Provider (MSP)

-   Provides a team of experts to manage and operate infrastructure.

------------------------------------------------------------------------

# 38. Right-Sizing

**Right-sizing** = finding the most cost-effective resource size for a
workload.

-   Avoid over-provisioning.
-   Match compute/storage resources to actual workload requirements.

------------------------------------------------------------------------

# 39. AWS Cost / Pricing Examples

## EC2

-   On-demand: charged based on usage/time.
-   Reserved: lower price with commitment.
-   Spot: lower price using spare capacity.

## Lambda

-   Pay based on execution/request usage.

## S3

Pricing depends on: - storage - requests - data transfer - retrieval for
applicable storage classes.

## EBS

-   Primarily volume/storage usage and applicable I/O/snapshot charges.

------------------------------------------------------------------------

# 40. Notes from Additional Scan --- Phases

## Cloud / Business Phases

1.  **Envision** --- how cloud will accelerate the business.
2.  **Align** --- identify gaps across the CAF.
3.  **Launch** --- deliver pilot initiatives.
4.  **Scale** --- expand pilot initiatives.

## Right-Sizing

-   Finding the most cost-effective resource size for a workload.

------------------------------------------------------------------------

# 41. AWS Training

-   **APN Technology Partner** --- provides hardware, connectivity,
    software.
-   **APN Consulting Partner** --- helps build on AWS.
-   **APN Training Partner** --- helps users learn AWS.
-   **AWS Managed Service Provider (MSP)** --- team of experts that
    manages and operates infrastructure.

------------------------------------------------------------------------

# 42. Additional Real-World Questions

## 1. Snowball Edge → S3

-   Transfer data from Snowball Edge to Amazon S3.
-   Useful for large-scale data transfer.

## 2. Amazon Inspector

-   Assess applications.
-   Scan EC2 for vulnerabilities.
-   Check against security best practices.

## 3. AWS Storage Gateway

-   Connect on-premises storage with AWS.
-   Can provide low-latency access to cloud-backed storage.

## 4. AWS Service Catalog

-   Create, manage and govern approved collections of AWS resources.
-   Can be used with Infrastructure as Code.

------------------------------------------------------------------------

# 43. Final Quick Revision

## Compute

-   EC2
-   Lambda
-   ECS
-   EKS
-   Fargate
-   Batch
-   Outposts
-   Local Zones
-   Wavelength

## Storage

-   S3
-   EBS
-   EFS
-   FSx
-   Storage Gateway
-   Snowball Edge
-   AWS Backup
-   DataSync

## Databases

-   RDS
-   Aurora
-   DynamoDB
-   DAX
-   Redshift
-   Neptune
-   DocumentDB
-   Timestream
-   ElastiCache

## Networking

-   VPC
-   Subnets
-   Route Tables
-   Internet Gateway
-   NAT Gateway
-   Security Groups
-   NACLs
-   VPC Peering
-   VPC Endpoints
-   PrivateLink
-   Transit Gateway
-   Direct Connect
-   Site-to-Site VPN
-   Client VPN
-   Cloud WAN

## Security

-   IAM
-   IAM Identity Center
-   KMS
-   CloudHSM
-   Secrets Manager
-   ACM
-   WAF
-   Shield
-   GuardDuty
-   Inspector
-   Macie
-   Security Hub
-   Firewall Manager
-   Config
-   CloudTrail

## Monitoring

-   CloudWatch
-   CloudTrail
-   X-Ray
-   AWS Health Dashboard
-   Trusted Advisor
-   Compute Optimizer

## Governance

-   Organizations
-   OUs
-   SCP
-   Control Tower
-   RAM
-   Artifact
-   Audit Manager
-   Service Catalog

## Integration / Messaging

-   SQS
-   SNS
-   EventBridge
-   Step Functions
-   Amazon MQ
-   API Gateway

## Analytics / AI

-   Athena
-   QuickSight
-   Kinesis
-   Rekognition
-   Transcribe
-   Polly
-   Translate
-   Lex
-   Comprehend
-   SageMaker AI
-   Kendra
-   Personalize
-   Textract

## Migration / DR

-   Application Migration Service (MGN)
-   Application Discovery Service
-   DataSync
-   DMS
-   Elastic Disaster Recovery
-   Snowball Edge
-   CloudEndure DR

## Architecture

-   Well-Architected Framework
-   Cloud Adoption Framework
-   Architecture Center

------------------------------------------------------------------------

# 44. Important Exam Distinctions

  If the question asks for...                Think of...
  ------------------------------------------ ----------------------------
  Virtual server                             EC2
  Serverless code                            Lambda
  Docker image storage                       ECR
  Run containers without managing servers    Fargate
  Managed Docker container orchestration     ECS
  Block storage for EC2                      EBS
  Shared file system                         EFS
  Object storage                             S3
  Very large offline data transfer           Snowball Edge
  On-prem ↔ AWS storage integration          Storage Gateway
  Relational database                        RDS / Aurora
  Key-value NoSQL                            DynamoDB
  DynamoDB cache                             DAX
  Data warehouse                             Redshift
  SQL query over S3                          Athena
  BI dashboards                              QuickSight
  Real-time streams                          Kinesis
  CDN                                        CloudFront
  DNS                                        Route 53
  DDoS protection                            Shield
  Web application firewall                   WAF
  Threat detection                           GuardDuty
  Vulnerability scanning                     Inspector
  Sensitive S3 data discovery                Macie
  Central security findings                  Security Hub
  Encryption keys                            KMS
  Hardware-backed key management             CloudHSM
  Secrets/passwords                          Secrets Manager
  SSL/TLS certificates                       ACM
  AWS API audit logs                         CloudTrail
  Metrics/logs/alarms                        CloudWatch
  Distributed tracing                        X-Ray
  Multi-account management                   Organizations
  Account-level guardrails                   SCP
  Multi-account landing zone/governance      Control Tower
  Compliance documents                       Artifact
  Audit evidence collection                  Audit Manager
  Resource configuration compliance          Config
  Cost estimation                            Pricing Calculator
  Cost analysis                              Cost Explorer
  Cost alerts                                Budgets
  Unusual spending                           Cost Anomaly Detection
  AWS service limits                         Service Quotas
  Private subnet → internet                  NAT Gateway
  Private access to AWS services             VPC Endpoint
  Private service connectivity across VPCs   PrivateLink
  Multiple VPC/network hub                   Transit Gateway
  Dedicated on-prem ↔ AWS connection         Direct Connect
  Encrypted on-prem ↔ AWS connection         Site-to-Site VPN
  User VPN access                            Client VPN
  Serverless workflow                        Step Functions
  Event-driven bus                           EventBridge
  Pub/sub fan-out                            SNS
  Queue/decoupling                           SQS
  Traditional message broker migration       Amazon MQ
  Disaster recovery --- cheapest/basic       Backup & Restore
  DR --- minimal core environment            Pilot Light
  DR --- small running environment           Warm Standby
  DR --- full parallel environment           Multi-Site / Hot Standby
  AWS architecture best practices            Well-Architected Framework
  Cloud transformation guidance              Cloud Adoption Framework
  AWS reference architectures                Architecture Center

------------------------------------------------------------------------

# 45. Source / OCR Note

The two scans contain handwritten notes over **24 pages + 4 pages**. The
original PDFs contain page images rather than machine-readable text, so
this document is a manual OCR/transcription of the handwriting, followed
by structural collation into Markdown. Ambiguous handwriting has been
retained as `[unclear]` where necessary rather than being presented as
certain text.
