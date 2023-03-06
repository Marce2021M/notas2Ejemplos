data {
  int<lower=0> n;
  array[n] int<lower=0> y;
}

parameters {
  real<lower=0, upper=1> theta;
}

model {

  // Prior

  theta ~ beta(89.4, 59.6);

  // Likelihood
  
  y ~ bernoulli(theta);
  
}

generated quantities {
  // Predictive posterior
  int<lower=0, upper=1> y_tilde = bernoulli_rng(theta);
}

