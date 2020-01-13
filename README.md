[![GitlabCI](https://gitlab.com/charoleizer/delphi-gitlab-ci-sample/badges/master/pipeline.svg?style=svg)](https://gitlab.com/charoleizer/delphi-gitlab-ci-sample/pipelines)


# Gitlab-CI with Docker-Windows for Delphi Projects

Pipelines: https://gitlab.com/charoleizer/delphi-gitlab-ci-sample/pipelines

# Stack
 - Windows 10 v1089 as Host;
 - Delphi CE;
 - .NET Framework v3.5;
 - Docker Desktop 2.1.0.0 ;
 - Gitlab-Runner with Docker-Windows executor and .NET 3.5 image;
 - Sonarqube 5.6.7 ;
 - Sonar-Scanner 3.2 ;
 - JFrog Artifactory OSS;
 - Portainer;

# Docker Images
  - .NET Framework: mcr.microsoft.com/dotnet/framework/runtime:3.5 (Windows)
  - Sonarqube with Delphi Plugin: charoleizer/sonarqube-delphi-5.6.7-alpine
  - JFrog Artifactory OSS: docker.bintray.io/jfrog/artifactory-oss
  - Portainer: portainer/portainer (Optional)

# Flow
  - Download gitlab runner for Windows, register, install and start as service. [[?]](https://docs.gitlab.com/runner/install/windows.html);
  - It will create 2 Runners container, one for cache and another for build
  - Switch to Windows Containers on Docker Desktop. 
  - Pull the .NET Framework image. This image will be used to create a container from Build Runner. [[?]](https://hub.docker.com/_/microsoft-dotnet-framework-runtime);
  - Bind the Delphi ./bin directory (C:\Program Files (x86)\Embarcadero\Studio\17.0\bin) with Build Runner Container.
  - Download Sonar-Scanner 3.2 and bind the scanner path with Build Runner Container. [[?]](https://github.com/SonarSource/sonar-scanner-cli/releases/tag/3.2.0.1227) 
  - Switch to Linux Containers on Docker Desktop.
  - Create a Linux-Container with Sonarqube. This container use [SandroLuck's](https://github.com/SandroLuck/SonarDelphi) Plugin. [[?]](https://hub.docker.com/r/charoleizer/sonarqube-delphi-5.6.7-alpine)
  - Sonar Scanner need a property file to analyse the code. [[?]](https://github.com/charoleizer/delphi-gitlab-ci-sample/blob/master/sonar-project.properties)
  - Create a Linux-Container with Artifactory OSS. [[?]](https://jfrog.com/open-source/)
  - Switch to Windows Containers on Docker Desktop.

# .gitlab-ci.yml
  - To know more about this file, [read it](https://docs.gitlab.com/ee/ci/quick_start/).
  - Take a look at the full [.gitlab-ci.yml](https://github.com/charoleizer/delphi-gitlab-ci-sample/blob/master/.gitlab-ci.yml) file 

#### Specificaly for this Delphi example, we will use this file to do 4 steps(stages):

#### *test:*
  - Build the test project with MSBuild;
  - Run the Test binary output;
  - Save the result file for future coverage;

#### *analyze:*
  - Run the sonar-scanner using sonar-project.properties configurations;

#### *build*
  - Build the project with MSBuild;
  - Deploy the artifact temporarily;

#### *deploy*
  - Take the build stage artifact, and compress it;
  - Set JFrog Artifactory OSS variables;
  - Upload the artifact by Artifactory rest API;

# Curiosities

#### *Why gitlab?*
  - Because Gitlab-CE and Gitlab-CI are free self-hosted tools. Maybe [Github Actions](https://github.com/features/actions) can change it. Waiting for Self-Hosted option. 
  
#### *Why is this project in github?*
  - Because github is the most famous repository and has a larger community
  
#### *Why not create an image with Delphi?*
  - Because of Embarcadero's license 
