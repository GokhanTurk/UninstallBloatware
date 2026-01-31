# 🛠️ UninstallBloatware

[🇹🇷 Türkçe](#turkish) | [🇺🇸 English](#english) 

---

<a name="turkish"></a>
## 🇹🇷 Türkçe

Bu araç, Windows üzerindeki gereksiz uygulamaları (bloatware) hem mevcut kullanıcıdan hem de sistem imajından kalıcı olarak temizleyen bir PowerShell aracıdır. Provisioned paketleri hedefleyerek, temizlenen uygulamaların yeni oluşturulan kullanıcı profillerinde tekrar yüklenmesini engeller.

### ✨ Öne Çıkan Özellikler
* **Derinlemesine Temizlik:** Uygulamaları "Provisioned" listesinden silerek yeni kullanıcı profillerinde tekrar oluşmalarını engeller.
* **Seçenekler:** Genel kullanım için **Standart** mod, kişisel yapılandırmam olan **Gokhan >_** modu ve özellikle sanal makineler için ideal olan (Terminal, Store, Notepad ve Edge harici her şeyi kaldıran) **Full** mod seçeneklerini sunar..
* **Otomasyon Uyumu:** * **Otomasyon Uyumu:** `-Selection` parametresi (örn: `-Selection 1`) sayesinde katılımsız (unattended) kurulumlarda onay beklemeden çalışır.
* **Hızlı Kurulum:** Dosya indirmeden, doğrudan bulut üzerinden çalıştırılabilir.
### 🚀 Kullanım

Aşağıdaki komutu PowerShell (Yönetici) üzerinde çalıştırın:
```PowerShell

irm https://raw.githubusercontent.com/GokhanTurk/UninstallBloatware/main/uninstall.ps1 | iex

```

Ya da daha kısaca:
```PowerShell

irm https://gokhanturk.com/uninstall | iex

```

📄 LİSANS

Bu proje MIT Lisansı altında lisanslanmıştır.

<a name="english"></a>
## 🇺🇸 English

A streamlined PowerShell utility designed to permanently remove pre-installed bloatware and telemetry from Windows systems. This tool targets both the current user and the system's provisioned packages to ensure a clean environment for existing and future accounts.

### ✨ Key Features
* **Deep Cleaning:** Removes apps from the "Provisioned" list, preventing them from reappearing on new user profiles.
* **Interactive Selection:** Offers a **Standard** mode for general usage, a **Gokhan >_** mode tailored to my personal preferences, and a **Full** mode ideal for Virtual Machines that removes everything except Terminal, Store, Notepad, and Edge.
* **Automation Ready:** Supports the `-Selection` parameter (e.g., `-Selection 1`) for unattended executions without user interaction.
* **Zero-Footprint:** Execute directly from the cloud without downloading local files.

### 🚀 How to Use

You can use this script with this command via PowerShell (Administrator):

```PowerShell

irm https://raw.githubusercontent.com/GokhanTurk/UninstallBloatware/main/uninstall.ps1 | iex

```

Or shorter:

```PowerShell

irm gokhanturk.com/uninstall | iex

```

📄 LICENCE

This project is licensed under the MIT License.
