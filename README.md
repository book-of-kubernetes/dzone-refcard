# Getting Started with Kubernetes Refcard

This repository provides examples for the Getting Started with Kubernetes
Refcard by Alan Hohn, published by DZone. 

## Getting Started

If you already have a Kubernetes cluster, you can use the files in the
`examples` and `todo` directories immediately to deploy the examples to your
cluster. If you don't have a Kubernetes cluster, and you don't want to install
one directly, you can use the `Vagrantfile` in this directory to create a
virtual machine using VirtualBox that you can use as a sandbox. Follow the
instructions for your distribution to install Vagrant and VirtualBox, then
run `vagrant up` in this directory to create the virtual machine. Vagrant will
run a provisioning script to set up Kubernetes and print out instructions.

Once you're ready to deploy and run Kubernetes in production, use a Kubernetes
provider that will set up your cloud provider for you properly. There are many
good options, including Elastic Kubernetes Service (EKS), Google Kubernetes
Engine (GKE), and Azure Kubernetes Service (AKS), as well as cloud-agnostic
Kubernetes distributions like Rancher Kubernetes Engine (RKE), Tanzu
Kubernetes Grid (TKG), and Red Hat OpenShift.

## Learning More

This Refcard can get you started understanding Kubernetes and deploying your
applications. To learn more about Kubernetes, how it works, and how best to
take advantage of all its features, I invite you to check out The Book of
Kubernetes, published 2022 by No Starch Press and available on [Amazon][az],
from the [publisher][pub], or many other places where books are sold.

[az]:https://www.amazon.com/Book-Kubernetes-Comprehensive-Container-Orchestration-ebook/dp/B09WJYZKHN
[pub]:https://nostarch.com/book-kubernetes
