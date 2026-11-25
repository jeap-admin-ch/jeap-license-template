# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres
to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.5.1] - 2026-11-25

### Dependencies
- **ch.admin.bit.jeap:jeap-central-publishing-maven-plugin**: 0.20.0 → 0.20.1 (patch)

## [1.5.0] - 2026-11-22

### Dependencies
- **ch.admin.bit.jeap:jeap-central-publishing-maven-plugin**: 0.19.0 → 0.20.0 (minor)

## [1.4.0] - 2026-11-18

### Dependencies
- **ch.admin.bit.jeap:jeap-central-publishing-maven-plugin**: 0.18.0 → 0.19.0 (minor)

## [1.3.2] - 2026-11-18

### Changed
- Build with Java 25, which the pipeline's recording of the deployed files needs, so that releases are mirrored

## [1.3.1] - 2026-11-18

### Fixed
- Deploy releases to the jEAP Nexus repository again, after the validation on Maven Central, as the jEAP parent does, which also restores the SBOM for the pipeline's Trivy scan

### Changed
- Do not wait for the publication on Maven Central, only for its validation, as the jEAP parent does
- Mirror the published artifacts to the further jEAP repositories

## [1.3.0] - 2026-11-15

### Dependencies
- **org.codehaus.mojo:license-maven-plugin**: 2.8.0 → 2.9.0 (minor)

## [1.2.0] - 2026-11-09

### Dependencies
- **org.codehaus.mojo:license-maven-plugin**: 2.7.1 → 2.8.0 (minor)

## [1.1.1] - 2026-10-27

### Dependencies
- **org.jacoco:jacoco-maven-plugin**: 0.8.15 → 0.8.16 (patch)

## [1.1.0] - 2026-09-17

### Dependencies
- **org.jacoco:jacoco-maven-plugin**: 0.8.12 → 0.8.15 (patch)
- **org.codehaus.mojo:license-maven-plugin**: 2.4.0 → 2.7.1 (minor)

## [1.0.3] - 2025-02-07

### Changed

- Maven central publication

## [1.0.2] - 2024-11-01

### Changed

- Prepared OSS distribution

## [1.0.1] - 2024-11-01

### Changed

- Removed colon after heading in template

## [1.0.0] - 2024-11-01

### Added

- Third-party license list file template for the Maven License Plugin
