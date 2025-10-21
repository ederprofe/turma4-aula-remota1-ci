# Atividade CI – Aula Remota 1 (DevOps / Terraform / Ansible)

Template oficial da **Aula Remota 1** para aplicação de **DevOps** com **Terraform**, **Ansible** e **GitHub Actions**.

> O **link do GitHub Classroom** para aceitar a atividade **será enviado por e-mail** pela coordenação/professor.
> Após aceitar, um repositório **privado** será criado automaticamente para cada aluno com este conteúdo inicial.

---

## 🎯 Objetivo
- Provisionar **Resource Group** e **Azure Function** com **Terraform**.
- Ajustar configurações da Function (ex.: **Always On** e **Python 3.10**) com **Ansible**.
- Validar automaticamente com **GitHub Actions** (CI).

---

## 📁 Estrutura
```
terraform/
  main.tf              # Esqueleto Terraform (RG, Storage, Service Plan, Function)
ansible/
  inventories/hosts    # Inventário exemplo (localhost)
  playbook.yml         # Playbook para Always On + Python 3.10
.github/workflows/
  ci.yml               # Pipeline CI (terraform init/validate/plan + syntax-check Ansible)
LICENSE                # MIT
```

---

## 🚀 Como usar (localmente)
1. **Clone** o repositório (após aceitar a atividade no Classroom):
   ```bash
   git clone https://github.com/<ORG>/<REPO-GERADO-PARA-VOCE>.git
   cd <REPO-GERADO-PARA-VOCE>
   ```

2. **Terraform**
   ```bash
   terraform -chdir=terraform init
   terraform -chdir=terraform validate
   terraform -chdir=terraform plan
   ```

3. **Ansible**
   ```bash
   ansible-playbook --syntax-check ansible/playbook.yml
   ```

> 💡 Caso você **realmente aplique** recursos em nuvem (e não apenas valide), configure as credenciais da Azure via Service Principal com as variáveis de ambiente: `ARM_CLIENT_ID`, `ARM_CLIENT_SECRET`, `ARM_SUBSCRIPTION_ID`, `ARM_TENANT_ID`.

---

## ⚙️ CI (GitHub Actions)
A pipeline em `.github/workflows/ci.yml` executa automaticamente, em cada **push** e **pull request**:
- `terraform init` / `validate` / `plan`
- `ansible-playbook --syntax-check`

Acompanhe o resultado na aba **Actions** do GitHub.

---

## 🧪 Entrega (sugestão)
1. Faça commits frequentes e claros:
   ```bash
   git add .
   git commit -m "Entrega Aula Remota 1 - CI (Terraform/Ansible)"
   git push origin main
   ```
2. (Opcional) Abra um Pull Request com o título: **"Entrega Atividade CI - Aula Remota 1"**.
3. Verifique se a pipeline passou na aba **Actions**.

---

## 🧰 Requisitos e dicas
- **Terraform ≥ 1.1.0** e provider `azurerm ~> 3.0.2` (ajustável conforme necessidade).
- **Ansible** instalado (em Windows use **WSL**).
- Mantenha `.github/workflows/ci.yml` no caminho correto.
- Teste localmente antes de enviar.
- Use `terraform -chdir=terraform destroy` para remover recursos criados em testes.

---

## 📚 Referências
- Terraform – Instalação e guia rápido: https://developer.hashicorp.com/terraform/tutorials/azure-get-started/install-cli
- Ansible – Instalação: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html
- GitHub Actions + GitOps (AKS): https://learn.microsoft.com/en-us/azure/architecture/guide/aks/aks-cicd-github-actions-and-gitops

---

**Bons commits e boas automações!**  
Prof. Éder
