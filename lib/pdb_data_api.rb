require 'httparty'
require_relative 'response_object'

class PDBDataAPI
  VERSION = 'v1'
  BASE_CORE_URL = "https://data.rcsb.org/rest/#{VERSION}/core"
  BASE_HOLDINGS_URL = "https://data.rcsb.org/rest/#{VERSION}/holdings"
  BASE_SCHEMA_URL = "https://data.rcsb.org/rest/#{VERSION}/schema"

  def self.assembly_service(entry_id, assembly_id)
    self.make_rest_request("#{BASE_CORE_URL}/assembly/#{entry_id}/#{assembly_id}")
  end

  def self.branched_entity_service(entry_id, entity_id)
    self.make_rest_request("#{BASE_CORE_URL}/branched_entity/#{entry_id}/#{entity_id}")
  end

  def self.nonpolymer_entity_service(entry_id, entity_id)
    self.make_rest_request("#{BASE_CORE_URL}/nonpolymer_entity/#{entry_id}/#{entity_id}")
  end

  def self.polymer_entity_service(entry_id, entity_id)
    self.make_rest_request("#{BASE_CORE_URL}/polymer_entity/#{entry_id}/#{entity_id}")
  end

  def self.uniprot_service(entry_id, entity_id)
    self.make_rest_request("#{BASE_CORE_URL}/uniprot/#{entry_id}/#{entity_id}")
  end

  def self.branched_entity_instance_service(entry_id, asym_id)
    self.make_rest_request("#{BASE_CORE_URL}/branched_entity_instance/#{entry_id}/#{asym_id}")
  end

  def self.nonpolymer_entity_instance_service(entry_id, asym_id)
    self.make_rest_request("#{BASE_CORE_URL}/nonpolymer_entity_instance/#{entry_id}/#{asym_id}")
  end

  def self.polymer_entity_instance_service(entry_id, entity_id)
    self.make_rest_request("#{BASE_CORE_URL}/polymer_entity_instance/#{entry_id}/#{entity_id}")
  end

  def self.chemical_component_service(comp_id)
    self.make_rest_request("#{BASE_CORE_URL}/chemcomp/#{comp_id}")
  end

  def self.drugbank_service(comp_id)
    self.make_rest_request("#{BASE_CORE_URL}/drugbank/#{comp_id}")
  end

  def self.entry_service(entry_id)
    self.make_rest_request("#{BASE_CORE_URL}/entry/#{entry_id}")
  end

  def self.pubmed_service(entry_id)
    self.make_rest_request("#{BASE_CORE_URL}/pubmed/#{entry_id}")
  end

  def self.entry_groups_service(group_id)
    self.make_rest_request("#{BASE_CORE_URL}/etnry_groups/#{group_id}")
  end

  def self.group_provenance_service(group_provenance_id)
    self.make_rest_request("#{BASE_CORE_URL}/group_provenance/#{group_provenance_id}")
  end

  def self.polymer_entity_groups_service(group_id)
    self.make_rest_request("#{BASE_CORE_URL}/polymer_entity_groups/#{group_id}")
  end

  def self.interface_service(entry_id, assembly_id, interface_id)
    self.make_rest_request("#{BASE_CORE_URL}/interface/#{entry_id}/#{assembly_id}/#{interface_id}")
  end

  def self.current_holdings_service
    self.make_rest_request("#{BASE_HOLDINGS_URL}/current/entry_ids")
  end

  def self.holdings_status_service(entry_ids)
    if entry_ids.class == Array
      entry_ids = entry_ids.join(',')
    end
    self.make_rest_request("#{BASE_HOLDINGS_URL}/status/#{entry_ids}")
  end

  def self.removed_holdings_service(entry_id=nil)
    entry_id ||= 'entry_ids'
    self.make_rest_request("#{BASE_HOLDINGS_URL}/removed/#{entry_id}")
  end

  def self.unreleased_holdings_service(entry_ids=nil)
    if entry_ids.class == Array
      entry_ids = entry_ids.join(',')
    end
    entry_ids ||= 'entry_ids'
    self.make_rest_request("#{BASE_HOLDINGS_URL}/unreleased/#{entry_ids}")
  end

  def self.assembly_schema_service
    self.make_rest_request("#{BASE_SCHEMA_URL}/assembly")
  end

  def self.branched_entity_instance_schema_service
    self.make_rest_request("#{BASE_SCHEMA_URL}/branched_entity_instance")
  end

  def self.branched_entity_schema_service
    self.make_rest_request("#{BASE_SCHEMA_URL}/branched_entity")
  end

  def self.chem_comp_schema_service
    self.make_rest_request("#{BASE_SCHEMA_URL}/chem_comp")
  end

  def self.drugbank_schema_service
    self.make_rest_request("#{BASE_SCHEMA_URL}/drugbank")
  end

  def self.entry_schema_service
    self.make_rest_request("#{BASE_SCHEMA_URL}/entry")
  end

  def self.nonpolymer_entity_instance_schema_service
    self.make_rest_request("#{BASE_SCHEMA_URL}/nonpolymer_entity_instance")
  end

  def self.nonpolymer_entity_schema_service
    self.make_rest_request("#{BASE_SCHEMA_URL}/nonpolymer_entity")
  end

  def self.polymer_entity_instance_schema_service
    self.make_rest_request("#{BASE_SCHEMA_URL}/polymer_entity_instance")
  end

  def self.polymer_entity_schema_service
    self.make_rest_request("#{BASE_SCHEMA_URL}/polymer_entity")
  end

  def self.pubmed_schema_service
    self.make_rest_request("#{BASE_SCHEMA_URL}/pubmed")
  end

  def self.uniprot_schema_service
    self.make_rest_request("#{BASE_SCHEMA_URL}/uniprot")
  end

  private

  def self.make_rest_request(url)
    response = HTTParty.get(url)
    ResponseObject.new(response)
  end
end
