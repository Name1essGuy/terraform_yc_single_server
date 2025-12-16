#!/bin/bash
set -e

echo "Cleaning up..."
terraform destroy -auto-approve
echo "Cleanup complete!"