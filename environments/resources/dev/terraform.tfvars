environment       = "dev"
default_region    = "us-central1"
project_id        = "presales-team-mahesh-15jul"
tf_backend_bucket = "presales-team-mahesh-15jul-tfstate"


##################################  SAs vars ###############################

service_sas = {
  "gke-pod-sa" = {
    description         = "Service account is used as the kubernetes service account (ksa) dev"
    display_name_prefix = "gke-pod-dev-sa"
    project_role = [
      "roles/datastore.owner",
      "roles/firebase.admin",
      "roles/logging.admin",
      "roles/secretmanager.secretAccessor",
      "roles/iam.serviceAccountTokenCreator",
      "roles/storage.admin",
      "roles/iam.workloadIdentityUser",
      "roles/servicemanagement.serviceController",

    ]
    sa_name_prefix = "gke-pod-dev-sa"

  }

  "gke-node-sa" = {
    description         = "Service account is used in the gke node pool dev"
    display_name_prefix = "gke-np-dev-sa"
    project_role = [
      "roles/monitoring.viewer",
      "roles/monitoring.metricWriter",
      "roles/logging.logWriter",
      "roles/stackdriver.resourceMetadata.writer",
      "roles/storage.objectViewer",
      "roles/iam.serviceAccountUser",

    ]
    sa_name_prefix = "gke-node-dev-sa"

  }
}


################################## GKE vars #####################################

gke_cluster_zones          = ["us-central1-a"]
master_authorized_networks = []

################################## CLOUD ARMOR RULES vars #####################################

cloud_armor_rules = [
  {
    priority    = 1000
    action      = "allow"
    description = "Allow access for SML"
    match = [
      {
        versioned_expr = "SRC_IPS_V1"
        config = {
          src_ip_ranges = ["*"]
        }
      }
    ]
  },

  {
    priority    = 2147483647
    action      = "deny(403)"
    description = "default rule"
    match = [
      {
        versioned_expr = "SRC_IPS_V1"
        config = {
          src_ip_ranges = ["*"]
        }
      }
    ]
  }
]

################################## INGRESS vars ###############################

cert_issuer_email = "shriram.gaddam@gmail.com"
api_domain        = "shriramgaddam.com"


##################################  NETWORK vars ##################################

routing_mode = "GLOBAL"

subnets = [
  {
    subnet_name               = "presales-team-mahesh-15jul-subnet-dev"
    subnet_ip                 = "10.0.0.0/16"
    subnet_region             = "us-central1"
    subnet_flow_logs          = "true"
    subnet_flow_logs_interval = "INTERVAL_10_MIN"
    subnet_flow_logs_sampling = 0.7
    subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
    subnet_private_access     = "true"

  }
]

secondary_ranges = {
  presales-team-mahesh-15jul-subnet-dev = [
    {
      range_name    = "secondary-pod-range-dev"
      ip_cidr_range = "10.1.0.0/16"
    },
    {
      range_name    = "secondary-service-range-dev"
      ip_cidr_range = "10.2.0.0/16"
    },
  ]
}

################################## EGRESS & INGRESS FIREWALL RULES vars ##################################

firewall_rules = [

  {
    name                    = "allow-restricted-egress"
    description             = "Allow traffic from restricted google apis"
    direction               = "EGRESS"
    priority                = 100
    ranges                  = ["0.0.0.0/0"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports    = ["443"]
    }]
    deny = []
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  },
  {
    name                    = "allow-ssh-ingress-from-iap"
    description             = "Allow ssh ingress from iap"
    direction               = "INGRESS"
    priority                = 1000
    ranges                  = ["35.235.240.0/20"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [
      {
        protocol = "tcp"
        ports    = ["22"]
      }
    ]
    deny = []
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  }
]


