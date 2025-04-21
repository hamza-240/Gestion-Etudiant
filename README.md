[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)


# 🎓 StudentManager - Gestion Scolaire Intelligente

**Application web complète de gestion académique**  
*Développée en Java EE avec architecture MVC et interface Bootstrap moderne*

![Java EE](https://img.shields.io/badge/Java_EE-ED8B00?style=for-the-badge&logo=java&logoColor=white)
![Bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)

## ✨ Fonctionnalités Avancées

### 🧑‍🎓 Gestion des Étudiants
- **Inscription complète** avec validation des données
- **Fiche étudiante détaillée** (coordonnées, parcours académique)
- **Recherche intelligente** (nom, filière, promotion)


### 🔐 Sécurité
- **Authentification** des utilisateurs
- **Journalisation** des activités (log4j)
- **Protection CSRF** intégrée

## 🛠 Architecture Technique

```mermaid
graph TD
    A[Interface Utilisateur] -->|JSP/Bootstrap| B[Servlets]
    B --> C[Couches Métiers]
    C --> D[DAO JDBC]
    D --> E[(Base MySQL)]
    B --> F[Services Utilitaires]
```

**Stack complète :**
- **Frontend** : JSP 2.3 + Bootstrap 5 + JavaScript
- **Backend** : Servlets Java EE 8
- **Data** : JDBC avec connection pooling
- **Sécurité** : Filtrés d'authentification
- **Build** : Maven

## 🚀 Guide d'Installation

### Prérequis
- Java 11+
- Apache Tomcat 9+
- MySQL 8.0+
- IDE (Eclipse/IntelliJ)

### Étapes
1. Cloner le dépôt :
   ```bash
   git clone https://github.com/ton-compte/StudentManager.git
   cd StudentManager
   ```



## 📄 Licence

Licence MIT - Voir [LICENSE](LICENSE) pour plus de détails.

