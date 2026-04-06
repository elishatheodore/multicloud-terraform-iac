#!/bin/bash
# Validation Test Suite for Multi-Cloud Infrastructure

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Module directories to test
MODULES=(
    "clouds/azure/networking"
    "clouds/azure/compute"
    "clouds/aws/networking"
    "clouds/aws/compute"
    "clouds/gcp/networking"
    "clouds/gcp/compute"
)

echo "🔍 Running Terraform validation tests..."
echo "=================================="

PASS_COUNT=0
FAIL_COUNT=0
TOTAL_COUNT=${#MODULES[@]}

for module in "${MODULES[@]}"; do
    echo ""
    echo -e "${YELLOW}Testing module: $module${NC}"
    
    if [ ! -d "$module" ]; then
        echo -e "${RED}❌ FAIL: Directory $module does not exist${NC}"
        ((FAIL_COUNT++))
        continue
    fi
    
    # Check for required files
    required_files=("main.tf" "variables.tf" "outputs.tf")
    for file in "${required_files[@]}"; do
        if [ ! -f "$module/$file" ]; then
            echo -e "${RED}❌ FAIL: Missing $file${NC}"
            ((FAIL_COUNT++))
            continue 2
        fi
    done
    
    # Run terraform init (without backend)
    echo "🔄 Running terraform init..."
    if ! terraform -chdir="$module" init -backend=false > /dev/null 2>&1; then
        echo -e "${RED}❌ FAIL: terraform init failed${NC}"
        ((FAIL_COUNT++))
        continue
    fi
    
    # Run terraform validate
    echo "✅ Running terraform validate..."
    if terraform -chdir="$module" validate > /dev/null 2>&1; then
        echo -e "${GREEN}✅ PASS: terraform validate successful${NC}"
        ((PASS_COUNT++))
    else
        echo -e "${RED}❌ FAIL: terraform validate failed${NC}"
        ((FAIL_COUNT++))
    fi
done

echo ""
echo "=================================="
echo "📊 Test Results Summary"
echo "=================================="
echo -e "Total Modules: ${YELLOW}$TOTAL_COUNT${NC}"
echo -e "Passed: ${GREEN}$PASS_COUNT${NC}"
echo -e "Failed: ${RED}$FAIL_COUNT${NC}"

if [ $FAIL_COUNT -eq 0 ]; then
    echo -e "${GREEN}🎉 All tests passed!${NC}"
    exit 0
else
    echo -e "${RED}❌ Some tests failed. Check the output above.${NC}"
    exit 1
fi
