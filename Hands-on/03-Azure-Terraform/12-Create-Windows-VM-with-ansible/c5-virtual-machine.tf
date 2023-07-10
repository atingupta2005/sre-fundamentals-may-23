resource "azurerm_windows_virtual_machine" "myvm" {
  count = var.vm_count
  name                = "AZ-VM-00-${count.index}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.rg.*.id[count.index],
  ]
os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.storage_account_type
  }
source_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "windows-11"
    sku       = "win11-21h2-pro"
    version   = "latest"
  }

}


resource "azurerm_dev_test_global_vm_shutdown_schedule" "vmshutdown" {
  count = var.vm_count
  virtual_machine_id = azurerm_windows_virtual_machine.myvm.*.id[count.index]
  location           = azurerm_windows_virtual_machine.myvm.*.location[count.index]
  enabled            = true

  daily_recurrence_time = "1400"
  timezone              = "India Standard Time"


  notification_settings {
    enabled         = false
  }
}


resource "azurerm_virtual_machine_extension" "vmext" {
    count = var.vm_count
    name                = "AZ-VM-00-${count.index}-ext"
	virtual_machine_id	= azurerm_windows_virtual_machine.myvm.*.id[count.index]

    publisher            = "Microsoft.Compute"
    type                 = "CustomScriptExtension"
    type_handler_version = "1.10"

    protected_settings = <<PROT
    {
        "fileUris": ["https://raw.githubusercontent.com/atingupta2005/sre-fundamentals-may-23/main/Hands-on/03-Azure-Terraform/12-Create-Windows-VM-with-ansible/scripts/configure-winrm.ps1"],
		"commandToExecute": "powershell -ExecutionPolicy Unrestricted -File configure-winrm.ps1",
		"managedIdentity" : {}
    }
    PROT
}