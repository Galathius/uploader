class Rack::Attack
  throttle('req/ip', limit: 5, period: 1.second) { |req| req.ip }
end