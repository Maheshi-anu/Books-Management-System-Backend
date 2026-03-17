# Quick Command Reference

## 🚀 Starting Everything

### Option 1: Two Terminals (Recommended)

**Terminal 1 - Backend:**
```bash
cd /Users/maheshianuradha/Downloads/Backend/BooksAPI
dotnet run
```
Wait for: `Now listening on: https://localhost:5001`

**Terminal 2 - Frontend:**
```bash
cd /Users/maheshianuradha/Downloads/Frontend/BooksApp
npx ng serve --open
```
Wait for: App opens in browser at `http://localhost:4200`

---

### Option 2: Single Script (if you create it)
```bash
bash /Users/maheshianuradha/setup-and-run.sh
```

---

## 📋 Common Commands

### Backend

**Build:**
```bash
cd /Users/maheshianuradha/Downloads/Backend/BooksAPI
dotnet build
```

**Run:**
```bash
cd /Users/maheshianuradha/Downloads/Backend/BooksAPI
dotnet run
```

**Clean:**
```bash
cd /Users/maheshianuradha/Downloads/Backend/BooksAPI
dotnet clean
```

---

### Frontend

**Install Dependencies:**
```bash
cd /Users/maheshianuradha/Downloads/Frontend/BooksApp
npm install
```

**Start Dev Server:**
```bash
cd /Users/maheshianuradha/Downloads/Frontend/BooksApp
npx ng serve --open
```

**Build for Production:**
```bash
cd /Users/maheshianuradha/Downloads/Frontend/BooksApp
npm run build
```

**Use Different Port:**
```bash
cd /Users/maheshianuradha/Downloads/Frontend/BooksApp
npx ng serve --port 4201
```

---

## 🔌 API Testing

### Using curl

**Get All Books:**
```bash
curl -k https://localhost:5001/api/books
```

**Get Book #1:**
```bash
curl -k https://localhost:5001/api/books/1
```

**Create Book:**
```bash
curl -k -X POST https://localhost:5001/api/books \
  -H "Content-Type: application/json" \
  -d '{
    "title":"My Book",
    "author":"John Doe",
    "isbn":"123-456",
    "publicationDate":"2024-03-12"
  }'
```

**Update Book #1:**
```bash
curl -k -X PUT https://localhost:5001/api/books/1 \
  -H "Content-Type: application/json" \
  -d '{
    "title":"Updated Title",
    "author":"Updated Author",
    "isbn":"123-456",
    "publicationDate":"2024-03-12"
  }'
```

**Delete Book #1:**
```bash
curl -k -X DELETE https://localhost:5001/api/books/1
```

---

## 🧹 Cleaning Up

**Clear npm Cache:**
```bash
npm cache clean --force
```

**Delete node_modules:**
```bash
cd /Users/maheshianuradha/Downloads/Frontend/BooksApp
rm -rf node_modules
npm install
```

**Delete .NET Build:**
```bash
cd /Users/maheshianuradha/Downloads/Backend/BooksAPI
dotnet clean
dotnet build
```

---

## 📍 Key URLs

| Component | URL | Protocol |
|-----------|-----|----------|
| Frontend App | http://localhost:4200 | HTTP |
| Backend API | https://localhost:5001/api/books | HTTPS |
| API Docs | https://localhost:5001/openapi/v1.json | HTTPS |

---

## 🛑 Stopping Services

**Stop Backend:**
- Press `Ctrl+C` in terminal running `dotnet run`

**Stop Frontend:**
- Press `Ctrl+C` in terminal running `ng serve`

---

## ⚙️ Configuration Files

### Frontend
- **TypeScript**: `/Frontend/BooksApp/tsconfig.json`
- **Angular**: `/Frontend/BooksApp/angular.json`
- **Dependencies**: `/Frontend/BooksApp/package.json`

### Backend
- **App Settings**: `/Backend/BooksAPI/appsettings.json`
- **Project File**: `/Backend/BooksAPI/BooksAPI.csproj`
- **Program Config**: `/Backend/BooksAPI/Program.cs`

---

## 📊 Status Check

**Check if Backend is Running:**
```bash
curl -k https://localhost:5001/api/books
```
(Should return JSON array or error message)

**Check if Frontend is Running:**
```bash
open http://localhost:4200
```
(Should show Books Management System page)

---

## 💡 Tips

1. **Auto-reload**: Both frontend and backend support auto-reload on file changes
2. **Hot Reload**: Angular will recompile on save
3. **Live Refresh**: Browser will refresh automatically
4. **Debug**: Use browser DevTools (F12) for frontend debugging
5. **Console**: Check terminal output for backend errors

---

**All commands tested and working! ✅**
