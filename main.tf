module "network" {
  source = "./modules/network"
}

module "compute" {
  source           = "./modules/compute"
  subnet_id        = module.network.subnet_id
  controller_sg_id = module.network.controller_sg_id
  agent_sg_id      = module.network.agent_sg_id
}