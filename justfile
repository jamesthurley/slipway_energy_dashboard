publisher := "jamesthurley"

build: clean && \
  (package "energy_cash_flow") \
  (package "energy_flow_chart") \
  (package "energy_graph") \
  (package "energy_lifetime") \
  (package "givenergy") \
  (package "octopus_tariff") \
  (package "tariff_rate_graph") \
  (package "utils") 

build-ci: clean && \
  (package-ci "energy_cash_flow") \
  (package-ci "energy_flow_chart") \
  (package-ci "energy_graph") \
  (package-ci "energy_lifetime") \
  (package-ci "givenergy") \
  (package-ci "octopus_tariff") \
  (package-ci "tariff_rate_graph") \
  (package-ci "utils") 

clean:
  rm -f components/*.tar

package name:
  slipway package components/{{name}}

package-ci name:
  docker run --rm -v "$(pwd)/components":/workspace -w /workspace slipwayhq/slipway:latest slipway package {{name}}

release version:
  git tag -a "{{version}}" -m "Release {{version}}"
  git push origin "{{version}}"
