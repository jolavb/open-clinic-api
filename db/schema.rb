# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180204221131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "baseline_counts", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.integer "result_group_id"
    t.string "ctgov_group_code"
    t.string "units"
    t.string "scope"
    t.integer "count"
  end

  create_table "baseline_measurements", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.integer "result_group_id"
    t.string "ctgov_group_code"
    t.string "classification"
    t.string "category"
    t.string "title"
    t.text "description"
    t.string "units"
    t.string "param_type"
    t.string "param_value"
    t.decimal "param_value_num"
    t.string "dispersion_type"
    t.string "dispersion_value"
    t.decimal "dispersion_value_num"
    t.decimal "dispersion_lower_limit"
    t.decimal "dispersion_upper_limit"
    t.string "explanation_of_na"
    t.index ["category"], name: "index_baseline_measurements_on_category"
    t.index ["classification"], name: "index_baseline_measurements_on_classification"
    t.index ["dispersion_type"], name: "index_baseline_measurements_on_dispersion_type"
    t.index ["param_type"], name: "index_baseline_measurements_on_param_type"
  end

  create_table "brief_summaries", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.text "description"
  end

  create_table "browse_conditions", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.string "mesh_term"
    t.string "downcase_mesh_term"
    t.index ["mesh_term"], name: "index_browse_conditions_on_mesh_term"
    t.index ["nct_id"], name: "index_browse_conditions_on_nct_id"
  end

  create_table "browse_interventions", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.string "mesh_term"
    t.string "downcase_mesh_term"
    t.index ["mesh_term"], name: "index_browse_interventions_on_mesh_term"
    t.index ["nct_id"], name: "index_browse_interventions_on_nct_id"
  end

  create_table "calculated_values", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.integer "number_of_facilities"
    t.integer "number_of_nsae_subjects"
    t.integer "number_of_sae_subjects"
    t.integer "registered_in_calendar_year"
    t.date "nlm_download_date"
    t.integer "actual_duration"
    t.boolean "were_results_reported", default: false
    t.integer "months_to_report_results"
    t.boolean "has_us_facility"
    t.boolean "has_single_facility", default: false
    t.integer "minimum_age_num"
    t.integer "maximum_age_num"
    t.string "minimum_age_unit"
    t.string "maximum_age_unit"
    t.index ["actual_duration"], name: "index_calculated_values_on_actual_duration"
    t.index ["months_to_report_results"], name: "index_calculated_values_on_months_to_report_results"
    t.index ["number_of_facilities"], name: "index_calculated_values_on_number_of_facilities"
  end

  create_table "central_contacts", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.string "contact_type"
    t.string "name"
    t.string "phone"
    t.string "email"
    t.index ["contact_type"], name: "index_central_contacts_on_contact_type"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.string "text"
    t.string "nct_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "conditions", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.string "name"
    t.string "downcase_name"
  end

  create_table "countries", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.string "name"
    t.boolean "removed"
  end

  create_table "design_group_interventions", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.integer "design_group_id"
    t.integer "intervention_id"
  end

  create_table "design_groups", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.string "group_type"
    t.string "title"
    t.text "description"
    t.index ["group_type"], name: "index_design_groups_on_group_type"
  end

  create_table "design_outcomes", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.string "outcome_type"
    t.text "measure"
    t.text "time_frame"
    t.string "population"
    t.text "description"
    t.index ["outcome_type"], name: "index_design_outcomes_on_outcome_type"
  end

  create_table "designs", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.string "allocation"
    t.string "intervention_model"
    t.string "observational_model"
    t.string "primary_purpose"
    t.string "time_perspective"
    t.string "masking"
    t.text "masking_description"
    t.text "intervention_model_description"
    t.boolean "subject_masked"
    t.boolean "caregiver_masked"
    t.boolean "investigator_masked"
    t.boolean "outcomes_assessor_masked"
    t.index ["caregiver_masked"], name: "index_designs_on_caregiver_masked"
    t.index ["investigator_masked"], name: "index_designs_on_investigator_masked"
    t.index ["masking"], name: "index_designs_on_masking"
    t.index ["outcomes_assessor_masked"], name: "index_designs_on_outcomes_assessor_masked"
    t.index ["subject_masked"], name: "index_designs_on_subject_masked"
  end

  create_table "detailed_descriptions", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.text "description"
  end

  create_table "drop_withdrawals", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.integer "result_group_id"
    t.string "ctgov_group_code"
    t.string "period"
    t.string "reason"
    t.integer "count"
    t.index ["period"], name: "index_drop_withdrawals_on_period"
  end

  create_table "eligibilities", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.string "sampling_method"
    t.string "gender"
    t.string "minimum_age"
    t.string "maximum_age"
    t.string "healthy_volunteers"
    t.text "population"
    t.text "criteria"
    t.text "gender_description"
    t.boolean "gender_based"
    t.index ["gender"], name: "index_eligibilities_on_gender"
    t.index ["healthy_volunteers"], name: "index_eligibilities_on_healthy_volunteers"
    t.index ["maximum_age"], name: "index_eligibilities_on_maximum_age"
    t.index ["minimum_age"], name: "index_eligibilities_on_minimum_age"
  end

  create_table "examples", force: :cascade do |t|
    t.text "text", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_examples_on_user_id"
  end

  create_table "facilities", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.string "status"
    t.string "name"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "country"
    t.index ["city"], name: "index_facilities_on_city"
    t.index ["country"], name: "index_facilities_on_country"
    t.index ["name"], name: "index_facilities_on_name"
    t.index ["state"], name: "index_facilities_on_state"
    t.index ["status"], name: "index_facilities_on_status"
  end

  create_table "facility_contacts", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.integer "facility_id"
    t.string "contact_type"
    t.string "name"
    t.string "email"
    t.string "phone"
    t.index ["contact_type"], name: "index_facility_contacts_on_contact_type"
  end

  create_table "facility_investigators", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.integer "facility_id"
    t.string "role"
    t.string "name"
  end

  create_table "id_information", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.string "id_type"
    t.string "id_value"
    t.index ["id_type"], name: "index_id_information_on_id_type"
  end

  create_table "intervention_other_names", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.integer "intervention_id"
    t.string "name"
  end

  create_table "interventions", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.string "intervention_type"
    t.string "name"
    t.text "description"
    t.index ["intervention_type"], name: "index_interventions_on_intervention_type"
  end

  create_table "keywords", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.string "name"
    t.string "downcase_name"
  end

  create_table "links", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.string "url"
    t.text "description"
  end

  create_table "mesh_headings", id: :serial, force: :cascade do |t|
    t.string "qualifier"
    t.string "heading"
    t.string "subcategory"
    t.index ["qualifier"], name: "index_mesh_headings_on_qualifier"
  end

  create_table "mesh_terms", id: :serial, force: :cascade do |t|
    t.string "qualifier"
    t.string "tree_number"
    t.string "description"
    t.string "mesh_term"
    t.string "downcase_mesh_term"
    t.index ["description"], name: "index_mesh_terms_on_description"
    t.index ["downcase_mesh_term"], name: "index_mesh_terms_on_downcase_mesh_term"
    t.index ["mesh_term"], name: "index_mesh_terms_on_mesh_term"
    t.index ["qualifier"], name: "index_mesh_terms_on_qualifier"
  end

  create_table "milestones", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.integer "result_group_id"
    t.string "ctgov_group_code"
    t.string "title"
    t.string "period"
    t.text "description"
    t.integer "count"
    t.index ["period"], name: "index_milestones_on_period"
  end

  create_table "outcome_analyses", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.integer "outcome_id"
    t.string "non_inferiority_type"
    t.text "non_inferiority_description"
    t.string "param_type"
    t.decimal "param_value"
    t.string "dispersion_type"
    t.decimal "dispersion_value"
    t.string "p_value_modifier"
    t.float "p_value"
    t.string "ci_n_sides"
    t.decimal "ci_percent"
    t.decimal "ci_lower_limit"
    t.decimal "ci_upper_limit"
    t.string "ci_upper_limit_na_comment"
    t.string "p_value_description"
    t.string "method"
    t.text "method_description"
    t.text "estimate_description"
    t.text "groups_description"
    t.text "other_analysis_description"
    t.index ["dispersion_type"], name: "index_outcome_analyses_on_dispersion_type"
    t.index ["param_type"], name: "index_outcome_analyses_on_param_type"
  end

  create_table "outcome_analysis_groups", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.integer "outcome_analysis_id"
    t.integer "result_group_id"
    t.string "ctgov_group_code"
  end

  create_table "outcome_counts", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.integer "outcome_id"
    t.integer "result_group_id"
    t.string "ctgov_group_code"
    t.string "scope"
    t.string "units"
    t.integer "count"
  end

  create_table "outcome_measurements", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.integer "outcome_id"
    t.integer "result_group_id"
    t.string "ctgov_group_code"
    t.string "classification"
    t.string "category"
    t.string "title"
    t.text "description"
    t.string "units"
    t.string "param_type"
    t.string "param_value"
    t.decimal "param_value_num"
    t.string "dispersion_type"
    t.string "dispersion_value"
    t.decimal "dispersion_value_num"
    t.decimal "dispersion_lower_limit"
    t.decimal "dispersion_upper_limit"
    t.text "explanation_of_na"
    t.index ["category"], name: "index_outcome_measurements_on_category"
    t.index ["classification"], name: "index_outcome_measurements_on_classification"
    t.index ["dispersion_type"], name: "index_outcome_measurements_on_dispersion_type"
  end

  create_table "outcomes", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.string "outcome_type"
    t.text "title"
    t.text "description"
    t.text "time_frame"
    t.text "population"
    t.string "anticipated_posting_month_year"
    t.string "units"
    t.string "units_analyzed"
    t.string "dispersion_type"
    t.string "param_type"
    t.index ["dispersion_type"], name: "index_outcomes_on_dispersion_type"
    t.index ["param_type"], name: "index_outcomes_on_param_type"
  end

  create_table "overall_officials", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.string "role"
    t.string "name"
    t.string "affiliation"
    t.index ["affiliation"], name: "index_overall_officials_on_affiliation"
    t.index ["nct_id"], name: "index_overall_officials_on_nct_id"
  end

  create_table "participant_flows", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.text "recruitment_details"
    t.text "pre_assignment_details"
  end

  create_table "reported_events", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.integer "result_group_id"
    t.string "ctgov_group_code"
    t.text "time_frame"
    t.string "event_type"
    t.string "default_vocab"
    t.string "default_assessment"
    t.integer "subjects_affected"
    t.integer "subjects_at_risk"
    t.text "description"
    t.integer "event_count"
    t.string "organ_system"
    t.string "adverse_event_term"
    t.integer "frequency_threshold"
    t.string "vocab"
    t.string "assessment"
    t.index ["event_type"], name: "index_reported_events_on_event_type"
    t.index ["subjects_affected"], name: "index_reported_events_on_subjects_affected"
  end

  create_table "responsible_parties", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.string "responsible_party_type"
    t.string "name"
    t.string "title"
    t.string "organization"
    t.text "affiliation"
    t.index ["nct_id"], name: "index_responsible_parties_on_nct_id"
    t.index ["organization"], name: "index_responsible_parties_on_organization"
    t.index ["responsible_party_type"], name: "index_responsible_parties_on_responsible_party_type"
  end

  create_table "result_agreements", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.string "pi_employee"
    t.text "agreement"
  end

  create_table "result_contacts", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.string "organization"
    t.string "name"
    t.string "phone"
    t.string "email"
    t.index ["organization"], name: "index_result_contacts_on_organization"
  end

  create_table "result_groups", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.string "ctgov_group_code"
    t.string "result_type"
    t.string "title"
    t.text "description"
    t.index ["result_type"], name: "index_result_groups_on_result_type"
  end

  create_table "sponsors", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.string "agency_class"
    t.string "lead_or_collaborator"
    t.string "name"
    t.integer "u_sponsor_id"
    t.index ["agency_class"], name: "index_sponsors_on_agency_class"
    t.index ["name"], name: "index_sponsors_on_name"
  end

  create_table "studies", id: false, force: :cascade do |t|
    t.string "nct_id"
    t.string "nlm_download_date_description"
    t.date "first_received_date"
    t.date "last_changed_date"
    t.date "first_received_results_date"
    t.date "received_results_disposit_date"
    t.string "start_month_year"
    t.string "start_date_type"
    t.date "start_date"
    t.string "verification_month_year"
    t.date "verification_date"
    t.string "completion_month_year"
    t.string "completion_date_type"
    t.date "completion_date"
    t.string "primary_completion_month_year"
    t.string "primary_completion_date_type"
    t.date "primary_completion_date"
    t.string "target_duration"
    t.string "study_type"
    t.string "acronym"
    t.text "baseline_population"
    t.text "brief_title"
    t.text "official_title"
    t.string "overall_status"
    t.string "last_known_status"
    t.string "phase"
    t.integer "enrollment"
    t.string "enrollment_type"
    t.string "source"
    t.string "limitations_and_caveats"
    t.integer "number_of_arms"
    t.integer "number_of_groups"
    t.string "why_stopped"
    t.boolean "has_expanded_access"
    t.boolean "expanded_access_type_individual"
    t.boolean "expanded_access_type_intermediate"
    t.boolean "expanded_access_type_treatment"
    t.boolean "has_dmc"
    t.boolean "is_fda_regulated_drug"
    t.boolean "is_fda_regulated_device"
    t.boolean "is_unapproved_device"
    t.boolean "is_ppsd"
    t.boolean "is_us_export"
    t.string "biospec_retention"
    t.text "biospec_description"
    t.string "plan_to_share_ipd"
    t.string "plan_to_share_ipd_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enrollment_type"], name: "index_studies_on_enrollment_type"
    t.index ["first_received_results_date"], name: "index_studies_on_first_received_results_date"
    t.index ["last_known_status"], name: "index_studies_on_last_known_status"
    t.index ["nct_id"], name: "index_studies_on_nct_id", unique: true
    t.index ["overall_status"], name: "index_studies_on_overall_status"
    t.index ["phase"], name: "index_studies_on_phase"
    t.index ["primary_completion_date_type"], name: "index_studies_on_primary_completion_date_type"
    t.index ["received_results_disposit_date"], name: "index_studies_on_received_results_disposit_date"
    t.index ["source"], name: "index_studies_on_source"
    t.index ["study_type"], name: "index_studies_on_study_type"
  end

  create_table "study_references", id: :serial, force: :cascade do |t|
    t.string "nct_id"
    t.string "pmid"
    t.string "reference_type"
    t.text "citation"
    t.index ["reference_type"], name: "index_study_references_on_reference_type"
  end

  create_table "u_sponsors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "token", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  add_foreign_key "comments", "users"
  add_foreign_key "examples", "users"
end
