## Pull Request Checklist

### Pre-merge Requirements

- [ ] **Code Quality**
  - [ ] `terraform fmt` run on all files
  - [ ] `terraform validate` passes for all modules
  - [ ] Pre-commit hooks pass locally
  - [ ] No linting errors or warnings

- [ ] **Testing**
  - [ ] `./tests/validate.sh` passes
  - [ ] Manual deployment tested in at least one cloud
  - [ ] Environment-specific tfvars work correctly

- [ ] **Documentation**
  - [ ] Module READMEs updated if needed
  - [ ] Variable descriptions are complete
  - [ ] Output descriptions are complete

### Description of Changes

<!-- 
Please provide a clear description of what this PR changes.
Include:
- What was changed
- Why the change was made
- How to test the changes
-->

### Testing Instructions

<!--
Describe how reviewers can test these changes.
-->

### Screenshots (if applicable)

<!--
Add screenshots to demonstrate the changes.
-->

### Additional Notes

<!--
Any additional context or notes for reviewers.
-->
