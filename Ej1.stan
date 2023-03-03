data {
  int<lower=0> n;
  int<lower=0,upper=1> x[n];
}

parameters {
  real<lower=0, upper=1> theta;
}

model {
  // Likelihood
  for (i in 1:n) {
    x[i] ~ bernoulli(theta);
  }
  
  // Prior
  theta ~ beta(89.4, 59.6);
}

generated quantities {
  int<lower=0, upper=1> x1[2];
  
  // Predictive posterior
  for (j in 1:2) {
    x1[j] = bernoulli_rng(theta);
  }
}
