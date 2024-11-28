# Invoice Validation & Processing
A sample project demonstrating Power Automate RPA principles with some reusable scripts, components and examples.

## Managing Desktop Flows Under Source Control
Power Automate Desktop Flows are defined using the Robin scripting language. Flow definitions are embedded within a data.xml file where they are stored in a `<Definition>` XML node alongside other Flow metadata. You can see an example Desktop Flow definition for the Post New Invoice Flow in this file: 
- [ContosoInvoicing-PostNewInvoice-E552F6B0-1559-482D-9B9A-A20317BC6C23.json.data.xml](./solutions/Invoicevalidationandprocessing/Workflows/ContosoInvoicing-PostNewInvoice-E552F6B0-1559-482D-9B9A-A20317BC6C23.json.data.xml)

This example has been unpacked using the [Power Platform CLI](https://learn.microsoft.com/en-us/power-platform/developer/cli/introduction) 

The challenge with this approach is that common developer tasks such as performing code reviews and version history

### Sample Scripts
This repository includes two samples that enable Desktop Flow.
- [unpack-robinscript.ps1](./.github/workflows/scripts/unpack-robinscript.ps1): Unpacks Robin script from data.xml files into data.xml.robin files, either from the command line or as part of a DevOps process.
  
  To see an example of this as part of GitHub action, review the `extract-robinscript` step in the [export-and-branch-solution.yml](./.github/workflows/export-and-branch-solution.yml) sample workflow.
  
- [repack-robinscript.ps1](./.github/workflows/scripts/repack-robinscript.ps1): Repacks Robin script from data.xml.robin files back into data.xml files, either from the command line or as part of a DevOps process.

  To see an example of this as part of GitHub action, review the `Pack Robin Scripts` step in the [release-to-target-with-inputs.yml](./.github/workflows/release-to-target-with-inputs.yml) sample workflow.

The above GitHub workflows are based on the Microsoft Learn sample which is available here https://learn.microsoft.com/en-us/power-platform/alm/tutorials/github-actions-start
