PumaWorkerKiller.config do |config|
  config.ram           = ENV.fetch("PWK_RAM",7680).to_i
  config.frequency     = ENV.fetch("PWK_FREQUENCY",15).to_i
  config.percent_usage = ENV.fetch("PWK_PERCENT_USAGE",0.8).to_f
end
PumaWorkerKiller.start