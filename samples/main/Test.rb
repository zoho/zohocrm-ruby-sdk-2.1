require 'ZCRMSDK'

require_relative '../sample/Initializer/Initialize'
require_relative '../sample/contact_roles/contact_roles'
require_relative '../sample/custom_views/custom_views'
require_relative '../sample/attachments/attachments'
require_relative '../sample/blueprint/blueprint'
require_relative '../sample/bulkread/bulkread'
require_relative '../sample/bulkwrite/bulkwrite'
require_relative '../sample/currencies/currencies'
require_relative '../sample/fields/field'
require_relative '../sample/file/file'
require_relative '../sample/layouts/layouts'
require_relative '../sample/modules/modules'
require_relative '../sample/notes/notes'
require_relative '../sample/notifications/notification'
require_relative '../sample/organization/organization'
require_relative '../sample/profiles/profiles'
require_relative '../sample/query/query'
require_relative '../sample/records/records'
require_relative '../sample/related_list/related_list'
require_relative '../sample/roles/roles'
require_relative '../sample/variables/variables'
require_relative '../sample/variables_group/variables_group'
require_relative '../sample/territories/territories'
require_relative '../sample/taxes/taxes'
require_relative '../sample/tags/tags'
require_relative '../sample/related_records/related_records'
require_relative '../sample/shared_records/shared_records'
require_relative '../sample/users/users'
require_relative '../sample/threading/single_user/single_thread'
require_relative '../sample/threading/single_user/multi_thread'
require_relative '../sample/threading/multi_user/single_thread'
require_relative '../sample/threading/multi_user/multi_thread'

require_relative '../sample/assignment_rules/assignment_rules'
require_relative '../sample/email_templates/email_templates'
require_relative '../sample/field_attachments/field_attachments'
require_relative '../sample/inventory_templates/inventory_templates'
require_relative '../sample/pipeline/pipeline'
require_relative '../sample/send_mail/send_mail'
require_relative '../sample/wizards/wizard'

class Test
  def self.main
    Initialize.Initialize
    Test.assignment_rules
    Test.attachments
    Test.blueprint
    Test.bulkread
    Test.bulkwrite
    Test.contact_roles
    Test.currencies
    Test.custom_views
    Test.emailtemplate
    Test.field_attachments
    Test.fields
    Test.file
    Test.inventory_templates
    Test.layouts
    Test.modules
    Test.notes
    Test.notifications
    Test.org
    Test.pipeline
    Test.profiles
    Test.query
    Test.records
    Test.related_lists
    Test.related_records
    Test.roles
    Test.send_mail
    Test.shared_records
    Test.tags
    Test.taxes
    Test.territories
    Test.users
    Test.variables
    Test.variables_group
    Test.wizards
    Test.threading
  end

  def self.assignment_rules
    rule_id = 04353013
    Assignment_Rules.get_assignment_rules()
    Assignment_Rules.get_assignment_rule(rule_id)
  end

  def self.attachments
    module_api_name = 'Leads'
    record_id = 10177003
    attachment_id = 10260001
    absolute_file_path = '/Users/filename.txt'
    destination_folder = '/Users/'
    attachment_url = 'https://www.gstatic.com/images/branding/product/2x/photos_96dp.png'
    attachment_ids = [10256005]
    Attachment.get_attachments(module_api_name, record_id)
    Attachment.upload_attachment(module_api_name, record_id, absolute_file_path)
    Attachment.delete_attachments(module_api_name, record_id, attachment_ids)
    Attachment.download_attachment(module_api_name, record_id, attachment_id, destination_folder)
    Attachment.delete_attachment(module_api_name, record_id, attachment_id)
    Attachment.upload_link_attachment(module_api_name, record_id, attachment_url)
  end

  def self.blueprint
    module_api_name = 'Leads'
    record_id = 04381002
    transition_id = 00173093
    Blueprint.get_blueprint(module_api_name, record_id)
    Blueprint.update_blueprint(module_api_name, record_id, transition_id)
  end

  def self.bulkread
    module_api_name = 'Leads'
    job_id = 10273001
    destination_folder = '/Users/Documents/'
    Bulkread.create_bulk_read_job(module_api_name)
    Bulkread.get_bulkread_job_details(job_id)
    Bulkread.download_result(job_id, destination_folder)
  end

  def self.bulkwrite
    absolute_file_path = '/Users/Documents/Leads.zip'
    org_id = '673573045'
    module_api_name = 'Leads'
    file_id = '10275001'
    job_id = 10277002
    download_url = 'https://download-accl.zoho.com/v2/crm/673573045/bulk-write/10277002/10277002.zip'
    destination_folder = '/Users/Documents/'
    Bulkwrite.upload_file(org_id, absolute_file_path)
    Bulkwrite.create_bulk_write_job(module_api_name, file_id)
    Bulkwrite.get_bulk_write_job_details(job_id)
    Bulkwrite.download_bulk_write_result(download_url, destination_folder) 
  end

  def self.contact_roles
    contact_role_id = 07540004
    contact_role_ids = [07540003, 08137060, 08137059]
    Contact_Roles.get_contact_role(contact_role_id)
    Contact_Roles.get_contact_roles
    Contact_Roles.create_contact_roles
    Contact_Roles.update_contact_roles(contact_role_ids)
    Contact_Roles.update_contact_role(contact_role_id)
    Contact_Roles.delete_contact_role(contact_role_id)
    Contact_Roles.delete_contact_roles(contact_role_ids)
  end
  
  def self.currencies
    currency_id = 07368016
    Currency.get_currencies
    Currency.add_currencies
    Currency.update_currencies
    Currency.enable_multiple_currencies
    Currency.update_base_currency
    Currency.get_currency(currency_id)
    Currency.update_currency(currency_id)
  end

  def self.custom_views
    module_api_name = 'Leads'
    custom_id = 3_524_033_000_000_089_005
    # names = ["Products", "Tasks", "Vendors", "Calls", "Leads", "Deals", "Campaigns", "Quotes", "Invoices", "Attachments", "Price_Books", "Sales_Orders", "Contacts", "Solutions", "Events", "Purchase_Orders", "Accounts", "Cases", "Notes"]
    # names.each do |name|
    #   Custom_Views.get_custom_views(name)
    # end
    Custom_Views.get_custom_views(module_api_name)
    Custom_Views.get_custom_view(module_api_name, custom_id)
  end

  def self.emailtemplate
    email_template_id = 079
    Email_Templates.get_email_templates("Deals")
    Email_Templates.get_email_template_by_id(email_template_id)
  end

  def self.field_attachments
    destination_folder = "/Users//Documents/"
    Field_Attachments.get_field_attachments("Leads", 06920147, 09480003, destination_folder)
  end

  def self.fields
    module_api_name = 'Leads'
    field_id = 3_524_033_000_000_050_001
    # names = ["Products", "Tasks", "Vendors", "Calls", "Leads", "Deals", "Campaigns", "Quotes", "Invoices", "Attachments", "Price_Books", "Sales_Orders", "Contacts", "Solutions", "Events", "Purchase_Orders", "Accounts", "Cases", "Notes" ]
    # names.each do |name|
    #   Field.get_fields(name)
    # end 
    Field.get_fields(module_api_name)
    Field.get_field(module_api_name, field_id)
  end

  def self.file
    absolute_file_path = '/Users/Documents/download.png'
    destination_folder = '/Users/Documents/'
    id = 'idae9c710efe0fe8d'
    File.upload_file(absolute_file_path)
    File.get_file(id, destination_folder)
  end

  def self.inventory_templates
    inventory_template_id = 00174003
    Inventory_Templates.get_inventory_templates
    Inventory_Templates.get_inventory_template_by_id(inventory_template_id)
  end

  def self.layouts
    module_api_name = 'Leads'
    layout_id = 3_524_033_000_000_091_055
    # names = ["Products", "Tasks", "Vendors", "Calls", "Leads", "Deals", "Campaigns", "Quotes", "Invoices", "Attachments", "Price_Books", "Sales_Orders", "Contacts", "Solutions", "Events", "Purchase_Orders", "Accounts", "Cases", "Notes" ]
    # names.each do |name|
    #   Layout.get_layouts(name)
    # end
    Layout.get_layouts(module_api_name)
    Layout.get_layout(module_api_name, layout_id)
  end

  def self.modules
    module_api_name = 'apiName2'
    module_id = 03905003
    Module.get_modules
    Module.get_module(module_api_name)
    Module.update_module_by_id(module_id)
    Module.update_module_by_api_name(module_api_name)
  end

  def self.notes
    notes_id = [00208205]
    note_id = 00208206
    Note.get_notes
    Note.create_notes
    Note.update_notes
    Note.delete_notes(notes_id)
    Note.get_note(note_id)
    Note.update_note(note_id)
    Note.delete_note(note_id)
  end

  def self.notifications
    channel_ids = [100680211]
    Notifications.enable_notifications
    Notifications.get_notification_details
    Notifications.update_notifications
    Notifications.update_notification
    Notifications.disable_notifications(channel_ids)
    Notifications.disable_notification
  end

  def self.org
    absolute_file_path = '/Users/Documents/download.png'
    Organization.get_organization
    Organization.upload_organization_photo(absolute_file_path)
  end

  def self.pipeline
    layout_id = 00091023
    pipeline_id = 09482001
    Pipelines.get_pipelines(layout_id)
    Pipelines.get_pipeline(pipeline_id,layout_id)
    Pipelines.create_pipelines(layout_id)
    Pipelines.update_pipelines(layout_id)
    Pipelines.update_pipeline(pipeline_id,layout_id)
    Pipelines.transfer_and_delete(layout_id)
  end

  def self.profiles
    profile_id = 00026011
    Profile.get_profiles
    Profile.get_profile(profile_id)
  end

  def self.query
    Queries.get_records
  end

  def self.records
    module_api_name = 'Leads'
    record_id = 06601007
    destination_folder = '/Users/Documents/'
    absolute_file_path = '/Users/Documents/download.png'
    record_ids = [10345003]
    job_id = '10362001'
    names = ["Products", "Tasks", "Vendors", "Calls", "Leads", "Deals", "Campaigns", "Quotes",
      "Invoices", "Price_Books", "Sales_Orders", "Contacts", "Solutions", "Events",
       "Purchase_Orders", "Accounts", "Cases", "Notes"]
    names.each do |name|
      Records.get_records(name)
    end
    Records.get_record(module_api_name, record_id)
    Records.update_record(module_api_name, record_id)
    Records.delete_record(module_api_name, record_id)
    Records.get_records(module_api_name)
    Records.create_records(module_api_name)
    Records.update_records(module_api_name)
    Records.delete_records(module_api_name, record_ids)
    Records.upsert_records(module_api_name)
    Records.get_deleted_records(module_api_name)
    Records.search_records(module_api_name)
    Records.convert_lead(record_id)
    Records.get_photo(module_api_name, record_id, destination_folder)
    Records.upload_photo(module_api_name, record_id, absolute_file_path)
    Records.delete_photo(module_api_name, record_id)
    Records.mass_update_records(module_api_name)
    Records.get_mass_update_status(module_api_name, job_id)
  end

  def self.related_lists
    module_api_name = 'Leads'
    related_list_id = 3_524_033_000_000_040_017
    # names = ["Products", "Tasks", "Vendors", "Calls", "Leads", "Deals", "Campaigns", "Quotes", "Invoices", "Attachments", "Price_Books", "Sales_Orders", "Contacts", "Solutions", "Events", "Purchase_Orders", "Accounts", "Cases", "Notes" ]
    # names.each do |name|
    #   RelatedList.get_related_lists(name)
    # end 
    RelatedList.get_related_lists(module_api_name)
    RelatedList.get_related_list(module_api_name, related_list_id)
  end

  def self.related_records
    module_api_name = 'Products'
    record_id = 10151033
    related_list_api_name = 'Price_Books'
    related_record_id = 10031010
    destination_folder = '/Users/Documents/'
    related_list_ids = [09296008]
    RelatedRecord.get_related_records(module_api_name, record_id, related_list_api_name)
    RelatedRecord.update_related_records(module_api_name, record_id, related_list_api_name)
    RelatedRecord.delink_records(module_api_name, record_id, related_list_api_name, related_list_ids)
    RelatedRecord.get_related_record(module_api_name, record_id, related_list_api_name, related_record_id, destination_folder)
    RelatedRecord.update_related_record(module_api_name, record_id, related_list_api_name, related_record_id)
    RelatedRecord.delink_record(module_api_name, record_id, related_list_api_name, related_record_id)
  end

  def self.roles
    role_id = 00026008
    Role.get_roles
    Role.get_role(role_id)
  end

  def self.send_mail
    Send_Mail.get_email_addresses
    Send_Mail.send_mail
  end

  def self.shared_records
    module_api_name = 'Leads'
    record_id = 10304001
    SharedRecord.get_shared_record_details(module_api_name, record_id)
    SharedRecord.share_record(module_api_name, record_id)
    SharedRecord.update_share_permissions(module_api_name, record_id)
    SharedRecord.revoke_shared_record(module_api_name, record_id)
  end

  def self.tags
    module_api_name = 'Leads'
    tag_id = 10329007
    record_id = 05623115
    tag_names = %w[dsad asdad]
    record_ids = [10304001, 05623115]
    conflict_id = '09342012'
    Tag.get_tags(module_api_name)
    Tag.create_tags(module_api_name)
    Tag.update_tags(module_api_name)
    Tag.update_tag(module_api_name, tag_id)
    Tag.delete_tag(tag_id)
    Tag.merge_tags(tag_id, conflict_id)
    Tag.add_tags_to_record(module_api_name, record_id, tag_names)
    Tag.remove_tags_from_record(module_api_name, record_id, tag_names)
    Tag.add_tags_to_multiple_records(module_api_name, record_ids, tag_names)
    Tag.remove_tags_from_multiple_records(module_api_name, record_ids, tag_names)
    Tag.get_record_count_for_tag(module_api_name, tag_id)
  end

  def self.taxes
    tax_id = 10329012
    tax_ids = [35952004, 10329013]
    Tax.get_taxes
    Tax.create_taxes
    Tax.update_taxes
    Tax.delete_taxes(tax_ids)
    Tax.get_tax(tax_id)
    Tax.delete_tax(tax_id)
  end

  def self.territories
    territory_id = 03051397
    Territory.get_territories
    Territory.get_territory(territory_id)
  end

  def self.users
    user_id = 10331010
    User.get_users
    User.create_user
    User.update_users
    User.get_user(user_id)
    User.update_user(user_id)
    User.delete_user(user_id)
  end

  def self.variables
    variable_ids = [10321016, 10321018]
    variable_id = 10321020
    variable_name = 'Variaggble33'
    Variable.get_variables
    Variable.create_variables
    Variable.update_variables(variable_ids)
    Variable.delete_variables(variable_ids)
    Variable.get_variable_by_id(variable_id)
    Variable.update_variable_by_id(variable_id)
    Variable.delete_variable(variable_id)
    Variable.get_variable_for_api_name(variable_name)
    Variable.update_variable_for_api_name(variable_name)
  end

  def self.variables_group
    variable_group_name = 'general'
    variable_group_id = 3_524_033_000_005_550_001
    VariableGroup.get_variable_groups
    VariableGroup.get_variable_group_by_id(variable_group_id)
    VariableGroup.get_variable_group_by_api_name(variable_group_name)
  end

  def self.wizards
    wizard_id = 09497009
    Wizard.get_wizards
    Wizard.get_wizard_by_id(wizard_id)
  end

  def self.threading
    module_api_name = 'Leads'
    SingleUser::SingleThreading.new(module_api_name).execute()
    SingleUser::MultiThreading.new(module_api_name).execute()
    MultiUser::SingleThreading.new(module_api_name).execute()
    MultiUser::MultiThreading.new(module_api_name).execute
  end
end
Test.main
