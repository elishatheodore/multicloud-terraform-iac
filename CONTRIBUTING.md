# Contributing to Multi-Cloud Infrastructure

Thank you for your interest in contributing to this multi-cloud Infrastructure as Code project! This guide will help you get started.

## 🚀 Getting Started

### Prerequisites

- **Terraform >= 1.3.0** installed locally
- **Git** for version control
- **Docker** (optional, for consistent environments)
- **Cloud CLI tools** (az, aws, gcloud) for testing
- **Text Editor** with Terraform/HCL support

### Development Setup

1. **Fork the Repository**
   ```bash
   # Fork on GitHub, then clone your fork
   git clone https://github.com/YOUR_USERNAME/azure-infrastructure.git
   cd azure-infrastructure
   ```

2. **Add Upstream Remote**
   ```bash
   git remote add upstream https://github.com/elishatheodore/azure-infrastructure.git
   ```

3. **Install Pre-commit Hooks**
   ```bash
   # Install pre-commit
   pip install pre-commit
   
   # Install hooks
   pre-commit install
   ```

4. **Create Feature Branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

## 🏗️ Development Workflow

### Code Standards

- **Terraform Format**: Run `terraform fmt -recursive` before committing
- **Variable Descriptions**: All variables must have `description` attributes
- **Output Descriptions**: All outputs must have `description` attributes
- **Naming Conventions**: Use shared abstractions in `shared/locals.tf`
- **Security**: Follow security best practices (no hardcoded secrets)

### Testing Your Changes

1. **Local Validation**
   ```bash
   # Run the validation suite
   ./tests/validate.sh
   ```

2. **Manual Testing**
   ```bash
   # Test deployment to dev environment
   cd clouds/azure/examples/complete  # or aws/gcp
   terraform plan -var-file=dev.tfvars
   terraform apply -var-file=dev.tfvars
   ```

3. **Security Scanning**
   ```bash
   # Run security tools locally
   tfsec ./clouds/azure
   checkov --framework terraform ./clouds/azure
   ```

## 📝 Submitting Changes

### Commit Standards

Use conventional commits for clear history:

- `feat:` - New features or functionality
- `fix:` - Bug fixes or patches
- `docs:` - Documentation changes
- `ci:` - CI/CD workflow changes
- `test:` - Test suite changes
- `chore:` - Maintenance tasks, refactoring

Example:
```bash
git commit -m "feat: add GCP compute module with instance management"
```

### Pull Request Process

1. **Update Fork**: Push changes to your fork
   ```bash
   git push origin feature/your-feature-name
   ```

2. **Create Pull Request**: Open PR against `main` branch
   - Use the PR template for comprehensive description
   - Link any related issues
   - Ensure all CI checks pass

3. **Code Review**: Respond to reviewer feedback promptly

## 🔧 Module Development

### Adding New Cloud Support

1. **Create Module Structure**
   ```
   clouds/newcloud/
   ├── networking/
   │   ├── main.tf
   │   ├── variables.tf
   │   ├── outputs.tf
   │   └── README.md
   ├── compute/
   │   ├── main.tf
   │   ├── variables.tf
   │   ├── outputs.tf
   │   └── README.md
   └── examples/complete/
       ├── main.tf
       ├── variables.tf
       ├── outputs.tf
       ├── dev.tfvars
       ├── staging.tfvars
       ├── prod.tfvars
       └── terraform.tfvars.example
   ```

2. **Follow Output Standards**
   - Implement `resource_ids`, `network_id`, `subnet_ids`, `instance_ids`, `instance_public_ips`, `instance_private_ips`
   - Maintain backward compatibility with legacy outputs

3. **Add CI/CD Workflow**
   - Copy existing workflow pattern
   - Update with cloud-specific authentication
   - Add environment support

### Module Standards

- **Consistent Variables**: Use shared variables where possible
- **Resource Naming**: Follow patterns in `shared/locals.tf`
- **Security**: Implement least privilege access
- **Documentation**: Include usage examples and prerequisites

## 🐛 Bug Reports

- Use the [Bug Report Template](.github/ISSUE_TEMPLATE/bug_report.md)
- Include environment details and reproduction steps
- Provide logs and error messages

## 💡 Feature Requests

- Use the [Feature Request Template](.github/ISSUE_TEMPLATE/feature_request.md)
- Describe use case and expected benefits
- Consider implementation alternatives

## 🏆 Recognition

Contributors are recognized in:
- **CHANGELOG.md** for significant contributions
- **README.md** acknowledgments section
- **GitHub Contributors** list

## 📞 Getting Help

- **Discussions**: Use GitHub Discussions for questions
- **Issues**: Report bugs or request features
- **Documentation**: Check existing docs and examples

## 📄 Code of Conduct

This project follows the [Contributor Covenant](https://www.contributor-covenant.org/) Code of Conduct.

---

**Thank you for contributing to multi-cloud infrastructure automation!** 🚀
