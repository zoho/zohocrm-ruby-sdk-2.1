require 'ZOHOCRMSDK2_1'

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
    Test.variables_group
    Test.variables
    Test.wizards
    Test.threading
  end

  def self.assignment_rules
    rule_id = 34770614353013
    Assignment_Rules.get_assignment_rules()
    Assignment_Rules.get_assignment_rule(rule_id)
  end

  def self.attachments
    module_api_name = 'Leads'
    record_id = 347706112107001
    attachment_id = 347706112631
    absolute_file_path = '/Users/Documents/file/download1.png'
    destination_folder = '/Users/Documents/file'
    attachment_url = 'https://www.gstatic.com/images/branding/product/2x/photos_96dp.png'
    attachment_ids = [347706112782002]
    Attachment.get_attachments(module_api_name, record_id)
    Attachment.upload_attachment(module_api_name, record_id, absolute_file_path)
    Attachment.delete_attachments(module_api_name, record_id, attachment_ids)
    Attachment.download_attachment(module_api_name, record_id, attachment_id, destination_folder)
    Attachment.delete_attachment(module_api_name, record_id, attachment_id)
    Attachment.upload_link_attachment(module_api_name, record_id, attachment_url)
  end

  def self.blueprint
    module_api_name = 'Leads'
    record_id = 34770614381002
    transition_id = 34770610173093
    Blueprint.get_blueprint(module_api_name, record_id)
    Blueprint.update_blueprint(module_api_name, record_id, transition_id)
  end

  def self.bulkread
    module_api_name = 'Leads'
    job_id = 347706112788007
    destination_folder = '/Users/Documents/file'
    Bulkread.create_bulk_read_job(module_api_name)
    Bulkread.get_bulkread_job_details(job_id)
    Bulkread.download_result(job_id, destination_folder)
  end

  def self.bulkwrite
    absolute_file_path = '/Users/Documents/Documents/CRM_SDK/Leads.zip'
    org_id = 'xxx'
    module_api_name = 'Leads'
    file_id = '347706112791001'
    job_id = 347706112793002
    download_url = 'https://download-accl.zoho.com/v2/crm/xxxx/bulk-write/347706112793002/347706112793002.zip'
    destination_folder = '/Users/Documents/file'
    Bulkwrite.upload_file(org_id, absolute_file_path)
    Bulkwrite.create_bulk_write_job(module_api_name, file_id)
    Bulkwrite.get_bulk_write_job_details(job_id)
    Bulkwrite.download_bulk_write_result(download_url, destination_folder)
  end

  def self.contact_roles
    contact_role_id = 347706112654001
    contact_role_ids = ["347706112654003", "347706112517017", "347706112517019"]
    Contact_Roles.get_contact_roles
    Contact_Roles.create_contact_roles
    Contact_Roles.update_contact_roles
    Contact_Roles.delete_contact_roles(contact_role_ids)
    Contact_Roles.get_contact_role(contact_role_id)
    Contact_Roles.update_contact_role(contact_role_id)
    Contact_Roles.delete_contact_role(contact_role_id)
    Contact_Roles.get_all_contact_roles_of_deal(347706110830013)
    Contact_Roles.get_contact_role_of_deal(34770610358009, 347706110830013)
    Contact_Roles.add_contact_role_to_deal(347706110938005, 347706110830013)
    Contact_Roles.remove_contact_role_from_deal(34770610358009, 347706110830013)
  end
  
  def self.currencies
    currency_id = 34770617368016
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
    custom_id = 34770610087501
    names = ["Products", "Tasks", "Vendors", "Calls", "Leads", "Deals", "Campaigns", "Quotes", "Invoices", "Attachments", "Price_Books", "Sales_Orders", "Contacts", "Solutions", "Events", "Purchase_Orders", "Accounts", "Cases", "Notes", "Activities"]
    names.each do |name|
      Custom_Views.get_custom_views(name)
    end
    Custom_Views.get_custom_views(module_api_name)
    Custom_Views.get_custom_view(module_api_name, custom_id)
  end

  def self.emailtemplate
    email_template_id = 347706179
    Email_Templates.get_email_templates("Deals")
    Email_Templates.get_email_template_by_id(email_template_id)
  end

  def self.field_attachments
    destination_folder = "/Users/Documents/file"
    Field_Attachments.get_field_attachments("Leads", 347706111613002, 347706111613032, destination_folder)
  end

  def self.fields
    module_api_name = 'Deals'
    field_id = 34770610050015
    names = ["Products", "Tasks", "Vendors", "Calls", "Leads", "Deals", "Campaigns", "Quotes", "Invoices", "Attachments", "Price_Books", "Sales_Orders", "Contacts", "Solutions", "Events", "Purchase_Orders", "Accounts", "Cases", "Notes", "Activities" ]
    names.each do |name|
      Field.get_fields(name)
    end
    Field.get_fields(module_api_name)
    Field.get_field(module_api_name, field_id)
  end

  def self.file
    absolute_file_path = '/Users/Documents/file/download.png'
    destination_folder = '/Users/Documents/file'
    id = 'ae9c7cefa418aec1d6a5cc2d9ab35c32e0ba42f71ef34569d72839f27361d35b'
    File.upload_file(absolute_file_path)
    File.get_file(id, destination_folder)
  end

  def self.inventory_templates
    inventory_template_id = 34770610174003
    Inventory_Templates.get_inventory_templates
    Inventory_Templates.get_inventory_template_by_id(inventory_template_id)
  end

  def self.layouts
    module_api_name = 'Leads'
    layout_id = 3_524_033___091_055
    names = ["Products", "Tasks", "Vendors", "Calls", "Leads", "Deals", "Campaigns", "Quotes", "Invoices", "Attachments", "Price_Books", "Sales_Orders", "Contacts", "Solutions", "Events", "Purchase_Orders", "Accounts", "Cases", "Notes", "Activities" ]
    names.each do |name|
      Layout.get_layouts(name)
    end
    Layout.get_layouts(module_api_name)
    Layout.get_layout(module_api_name, layout_id)
  end

  def self.modules
    module_api_name = 'apiName2'
    module_id = 34770610485367
    Module.get_modules
    Module.get_module(module_api_name)
    Module.update_module_by_id(module_id)
    Module.update_module_by_api_name(module_api_name)
  end

  def self.notes
    notes_id = [347706112535005]
    note_id = 347706112535004
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
    absolute_file_path = '/Users/Documents/file/download.png'
    Organization.get_organization
    Organization.upload_organization_photo(absolute_file_path)
  end

  def self.pipeline
    layout_id = 34770610091023
    pipeline_id = 34770619541006
    Pipelines.get_pipelines(layout_id)
    Pipelines.get_pipeline(pipeline_id,layout_id)
    Pipelines.create_pipelines(layout_id)
    Pipelines.update_pipelines(layout_id)
    Pipelines.update_pipeline(pipeline_id,layout_id)
    Pipelines.transfer_and_delete(layout_id)
  end

  def self.profiles
    profile_id = 34770610026011
    Profile.get_profiles
    Profile.get_profile(profile_id)
  end

  def self.query
    Queries.get_records
  end

  def self.records
    module_api_name = 'Leads'
    record_id = 347706112984009
    external_field_value = "External66"
    destination_folder = '/Users/Documents/file'
    absolute_file_path = '/Users/Documents/file/download1.png'
    record_ids = ["347706112991009", "External77"]
    job_id = '347706112989186'
    begin
      names = ["Products", "Tasks", "Vendors", "Calls", "Leads", "Deals", "Campaigns", "Quotes",
        "Invoices", "Price_Books", "Sales_Orders", "Contacts", "Solutions", "Events",
         "Purchase_Orders", "Accounts", "Cases", "Notes", "Activities"]
      names.each do |name|
        Records.get_records(name)
      end
      Records.get_record(module_api_name, record_id, destination_folder)
      Records.update_record(module_api_name, record_id)
      Records.delete_record(module_api_name, record_id)
      Records.get_record_using_external_id(module_api_name, external_field_value, destination_folder)
      Records.update_record_using_external_id(module_api_name, external_field_value)
      Records.delete_record_using_external_id(module_api_name, external_field_value)
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
      Records.get_record_count()
      Records.assign_territories_to_multiple_records(module_api_name)
      Records.assign_territory_to_record(module_api_name, record_id)
      Records.remove_territories_from_multiple_records(module_api_name)
      Records.remove_territories_from_record(module_api_name, record_id)
    rescue StandardError => e
      print e
    end
  end

  def self.related_lists
    module_api_name = 'Leads'
    related_list_id = 3_524_033___040_017
    names = ["Products", "Tasks", "Vendors", "Calls", "Leads", "Deals", "Campaigns", "Quotes", "Invoices", "Attachments", "Price_Books", "Sales_Orders", "Contacts", "Solutions", "Events", "Purchase_Orders", "Accounts", "Cases", "Notes", "Activities" ]
    names.each do |name|
      RelatedList.get_related_lists(name)
    end
    RelatedList.get_related_lists(module_api_name)
    RelatedList.get_related_list(module_api_name, related_list_id)
  end

  def self.related_records
    module_api_name = 'leads'
    record_id = 347706112984009
    related_list_api_name = 'products'
    related_record_id = 347706112999
    destination_folder = '/Users/test/RUBY/zohocrm-rubysdk-sample-application/src'
    related_list_ids = ["347706112999", "ProductExternal"]
    external_value = "External99"
    external_field_value = "ProductExternal"
    RelatedRecord.get_related_records(module_api_name, record_id, related_list_api_name)
    RelatedRecord.update_related_records(module_api_name, record_id, related_list_api_name)
    RelatedRecord.delink_records(module_api_name, record_id, related_list_api_name, related_list_ids)
    RelatedRecord.get_related_records_using_external_id(module_api_name, external_value, related_list_api_name)
    RelatedRecord.update_related_records_using_external_id(module_api_name, external_value, related_list_api_name)
    RelatedRecord.delete_related_records_using_external_id(module_api_name, external_value, related_list_api_name, related_list_ids)
    RelatedRecord.get_related_record(module_api_name, record_id, related_list_api_name, related_record_id, destination_folder)
    RelatedRecord.update_related_record(module_api_name, record_id, related_list_api_name, related_record_id)
    RelatedRecord.delink_record(module_api_name, record_id, related_list_api_name, related_record_id)
    RelatedRecord.get_related_record_using_external_id(module_api_name, external_value, related_list_api_name,
                                                       external_field_value, destination_folder)
    RelatedRecord.update_related_record_using_external_id(module_api_name, external_value, related_list_api_name,
                                                          external_field_value)
    RelatedRecord.delete_related_record_using_external_id(module_api_name, external_value, related_list_api_name,
                                                          external_field_value)
  end

  def self.roles
    role_id = 34770610026008
    Role.get_roles
    Role.get_role(role_id)
  end

  def self.send_mail
    Send_Mail.get_email_addresses
    Send_Mail.send_mail
  end

  def self.shared_records
    module_api_name = 'Leads'
    record_id = 347706112684003
    SharedRecord.get_shared_record_details(module_api_name, record_id)
    SharedRecord.share_record(module_api_name, record_id)
    SharedRecord.update_share_permissions(module_api_name, record_id)
    SharedRecord.revoke_shared_record(module_api_name, record_id)
  end

  def self.tags
    module_api_name = 'Leads'
    tag_id = 347706112712002
    record_id = 34770615623115
    tag_names = %w[dsad asdad]
    record_ids = [347706110304001, 34770615623115]
    conflict_id = '347706111405001'
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
    tax_id = 347706112833001
    tax_ids = [347706112833002, 347706110329013]
    Tax.get_taxes
    Tax.create_taxes
    Tax.update_taxes
    Tax.delete_taxes(tax_ids)
    Tax.get_tax(tax_id)
    Tax.delete_tax(tax_id)
  end

  def self.territories
    territory_id = 34770613051397
    Territory.get_territories
    Territory.get_territory(territory_id)
  end

  def self.users
    user_id = 347706110331010
    User.get_users
    User.create_user
    User.update_users
    User.get_user(user_id)
    User.update_user(user_id)
    User.delete_user(user_id)
  end

  def self.variables_group
    variable_group_name = 'general'
    variable_group_id = 347706110321010
    VariableGroup.get_variable_groups
    VariableGroup.get_variable_group_by_id(variable_group_id)
    VariableGroup.get_variable_group_by_api_name(variable_group_name)
  end

  def self.variables
    variable_ids = [347706112855007, 347706112855009]
    variable_id = 347706112855005
    variable_name = 'Variable11'
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

  def self.wizards
    wizard_id = 34770619497009
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
