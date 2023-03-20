require 'spec_helper'

RSpec.describe PDBDataAPI do
  let(:service) { PDBDataAPI.send(method, *params) }
  describe 'assembly_service' do
    let(:method) { :assembly_service }
    let(:params) { ['1RH7', 1] }
    it 'does not raise any errors' do
      expect(service.success).to be true
    end
  end

  describe 'branched_entity_service' do
    let(:method) { :branched_entity_service }
    let(:params) { ['4CYG', 2] }
    it 'does not raise any errors' do
      expect(service.success).to be true
    end
  end

  describe 'nonpolymer_entity_service' do
    let(:method) { :nonpolymer_entity_service }
    let(:params) { ['4G22', 2] }
    it 'does not raise any errors' do
      expect(service.success).to be true
    end
  end

  describe 'polymer_entity_service' do
    let(:method) { :polymer_entity_service }
    let(:params) { ['4G22', 1] }
    it 'does not raise any errors' do
      expect(service.success).to be true
    end
  end

  describe 'uniprot_service' do
    let(:method) { :uniprot_service }
    let(:params) { ['4G22', 1] }
    it 'does not raise any errors' do
      expect(service.success).to be true
    end
  end

  describe 'branched_entity_instance_service' do
    let(:method) { :branched_entity_instance_service }
    let(:params) { ['1US2', 'C'] }
    it 'does not raise any errors' do
      expect(service.success).to be true
    end
  end

  describe 'nonpolymer_entity_instance_service' do
    let(:method) { :nonpolymer_entity_instance_service }
    let(:params) { ['2FB2', 'J'] }
    it 'does not raise any errors' do
      expect(service.success).to be true
    end
  end

  describe 'polymer_entity_instance_service' do
    let(:method) { :polymer_entity_instance_service }
    let(:params) { ['2FBW', 'E'] }
    it 'does not raise any errors' do
      expect(service.success).to be true
    end
  end

  describe 'chemical_component_service' do
    let(:method) { :chemical_component_service }
    let(:params) { ['CFF'] }
    it 'does not raise any errors' do
      expect(service.success).to be true
    end
  end

  describe 'drugbank_service' do
    let(:method) { :drugbank_service }
    let(:params) { ['CFF'] }
    it 'does not raise any errors' do
      expect(service.success).to be true
    end
  end

  describe 'entry_service' do
    let(:method) { :entry_service }
    let(:params) { ['1EHZ'] }
    it 'does not raise any errors' do
      expect(service.success).to be true
    end
  end

  describe 'pubmed_service' do
    let(:method) { :pubmed_service }
    let(:params) { ['1EHZ'] }
    it 'does not raise any errors' do
      expect(service.success).to be true
    end
  end

  describe 'entry_groups_service' do
    let(:method) { :entry_groups_service }
    let(:params) { ['Q3Y9I6'] }
    it 'does not raise any errors' do
      # There's a bug in this endpoint. I've reported a bug on this
      # endpoint before and they seemed to have fixed it. However,
      # it seems to have a new bug now as it doesn't return anything.
      expect(service.success).to be false
    end
  end

  describe 'group_provenance_service' do
    let(:method) { :group_provenance_service }
    let(:params) { ['provenance_sequence_identity'] }
    it 'does not raise any errors' do
      expect(service.success).to be true
    end
  end

  describe 'polymer_entity_groups_service' do
    let(:method) { :polymer_entity_groups_service }
    let(:params) { ['Q3Y9I6'] }
    it 'does not raise any errors' do
      expect(service.success).to be true
    end
  end

  describe 'interface_service' do
    let(:method) { :interface_service }
    let(:params) { ['1RH7', 1, 1] }
    it 'does not raise any errors' do
      expect(service.success).to be true
    end
  end

  describe 'current_holdings_service' do
    let(:method) { :current_holdings_service }
    let(:params) { [] }
    it 'does not raise any errors' do
      expect(service.success).to be true
    end
  end

  describe 'holdings_status_service' do
    let(:method) { :holdings_status_service }
    context 'with one entry_id' do
      let(:params) { ['1EHz'] }
      it 'does not raise any errors' do
        expect(service.success).to be true
      end
    end

    context 'with multiple entry_ids' do
      let(:params) { [['1EHZ', '1RH7']] }
      it 'does not raise any errors' do
        expect(service.success).to be true
      end
    end
  end

  describe 'removed_holdings_service' do
    let(:method) { :removed_holdings_service }
    context 'with no entry_id' do
      let(:params) { [] }
      it 'does not raise any errors' do
        expect(service.success).to be true
      end
    end

    context 'with one entry_id' do
      let(:params) { ['1HHB'] }
      it 'does not raise any errors' do
        expect(service.success).to be true
      end
    end
  end

  describe 'unreleased_holdings_service' do
    let(:method) { :unreleased_holdings_service }
    context 'with no entry_id' do
      let(:params) { [] }
      it 'does not raise any errors' do
        expect(service.success).to be true
      end
    end

    context 'with one entry_id' do
      let(:params) { ['1D8O'] }
      it 'does not raise any errors' do
        expect(service.success).to be true
      end
    end

    context 'with multiple entry_ids' do
      let(:params) { [['1D8O', '3AIP']] }
      # I can't find a combination of IDs that
      # works for this endpoint. I don't know
      # if it's an RCSB bug or I'm using it wrong.
      it 'does not raise any errors' do
        expect(service.success).to be false
      end
    end
  end

  describe 'assembly_schema_service' do
    it 'does not raise any errors' do
      # expect(service.success).to be true
    end
  end

  describe 'branched_entity_instance_schema_service' do
    it 'does not raise any errors' do
      # expect(service.success).to be true
    end
  end

  describe 'branched_entity_schema_service' do
    it 'does not raise any errors' do
      # expect(service.success).to be true
    end
  end

  describe 'chem_comp_schema_service' do
    it 'does not raise any errors' do
      # expect(service.success).to be true
    end
  end

  describe 'drugbank_schema_service' do
    it 'does not raise any errors' do
      # expect(service.success).to be true
    end
  end

  describe 'entry_schema_service' do
    it 'does not raise any errors' do
      # expect(service.success).to be true
    end
  end

  describe 'nonpolymer_entity_instance_schema_service' do
    it 'does not raise any errors' do
      # expect(service.success).to be true
    end
  end

  describe 'nonpolymer_entity_schema_service' do
    it 'does not raise any errors' do
      # expect(service.success).to be true
    end
  end

  describe 'polymer_entity_instance_schema_service' do
    it 'does not raise any errors' do
      # expect(service.success).to be true
    end
  end

  describe 'polymer_entity_schema_service' do
    it 'does not raise any errors' do
      # expect(service.success).to be true
    end
  end

  describe 'pubmed_schema_service' do
    it 'does not raise any errors' do
      # expect(service.success).to be true
    end
  end

  describe 'uniprot_schema_service' do
    it 'does not raise any errors' do
      # expect(service.success).to be true
    end
  end
end
