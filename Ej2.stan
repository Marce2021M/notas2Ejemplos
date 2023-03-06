data {
  // Declare data variables
  int<lower=1> n;  // number of data points in the sample
  vector[n] x;     // vector of length n representing the data
}

parameters {
  // Declare unknown parameters to be estimated
  real mu;         // mean of the normal distribution
  real<lower=0> sig; // standard deviation of the normal distribution
  //real x_new;      // new observation to be predicted CHECK
}

model {
    // PRIORS
    // inciso A
  mu ~ normal(200,  6.324555);  // prior distribution for the mean
  sig ~ gamma(10, 1); // prior distribution for the standard deviation

    // inciso B

  //mu ~ normal(0, 100);  // prior distribution for the mean
  //sig ~ gamma(0.001, 0.001); // prior distribution for the standard deviation


  // Define the LIKELIHOOD and priors for the parameters
  x ~ normal(mu, sig); // likelihood of the data given the parameters
  
  //x_new ~ normal(mu, sig); // likelihood of the new observation given the parameters CHECK
  
}

generated quantities {
  // Generate predictions for a new observation
  real y_pred; // declare variable to store prediction
  y_pred = normal_rng(mu, sig); // generate a single draw from the normal distribution
}
