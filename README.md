# KITTYGRAM


Kittygram is a delightful web application that serves as a centralized database for all cat enthusiasts. Whether you're a proud cat owner or simply a fan of these furry friends, Kittygram allows users to create and share personalized "cat cards" showcasing the unique details of their feline companions.

Used libraries:  
- [Django                        3.2.3](https://docs.djangoproject.com/en/3.2/)  
- [djangorestframework           3.12.4](https://www.django-rest-framework.org/)  
- [djangorestframework-simplejwt 4.8.0](https://django-rest-framework-simplejwt.readthedocs.io/)

## Features

### Cat Cards
- Photo: Upload a charming photo of your cat to showcase their adorable face.
- Name: Provide your cat's name, because every feline deserves to be recognized.
- Date of Birth: Record your cat's birthday to celebrate and track their age.
- Color: Share the distinctive coat color of your cat, highlighting their individuality.
- Achievements: Brag about your cat's accomplishments or funny quirks by adding achievements to their card.

## **Installation and Deployment**

### **1. Clone the repository**
```sh
git clone https://github.com/Eduard-Bodreev/kittygram.git
cd kittygram
```

### **2. Set up environment variables**
Copy `.env.example` to `.env` and fill in the required variables:
```sh
cp .env.example .env
nano .env
```

### **3. Build and push Docker images**
```sh
cd frontend
docker build -t edik1511/kittygram_frontend .
docker push edik1511/kittygram_frontend

cd ../backend
docker build -t edik1511/kittygram_backend .
docker push edik1511/kittygram_backend

cd ../nginx
docker build -t edik1511/kittygram_gateway .
docker push edik1511/kittygram_gateway
```

### **4. Deploy on remote server**
#### **Connect to the server**
```sh
ssh -i PATH_TO_SSH_KEY edik@YOUR_SERVER_IP
```

#### **Set up the project directory**
```sh
mkdir -p ~/kittygram
cd ~/kittygram
```

#### **Copy deployment files to the server**
```sh
scp -i PATH_TO_SSH_KEY docker-compose.production.yml edik@YOUR_SERVER_IP:~/kittygram/
scp -i PATH_TO_SSH_KEY .env edik@YOUR_SERVER_IP:~/kittygram/
```

#### **Start containers**
```sh
docker compose -f docker-compose.production.yml up -d
```

#### **Run migrations and collect static files**
```sh
docker compose -f docker-compose.production.yml exec backend python manage.py migrate
docker compose -f docker-compose.production.yml exec backend python manage.py collectstatic --noinput
```

### **5. Verify deployment**
After deployment, access your application at:
```
curl -I http://YOUR_SERVER_IP:8080
```

### **6. Restarting services if needed**
```sh
docker compose -f docker-compose.production.yml restart
```

---

## **Author**
**Eduard Bodreev**  
GitHub: [Eduard-Bodreev](https://github.com/Eduard-Bodreev)

---
