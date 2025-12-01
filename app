<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Closet Social</title>
    
    <!-- PWA Manifest -->
    <link rel="manifest" href="data:application/manifest+json,{
      'name': 'Closet Social',
      'short_name': 'Closet',
      'start_url': '.',
      'display': 'standalone',
      'background_color': '#f3e8ff',
      'theme_color': '#c084fc',
      'icons': [{'src': 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTkyIiBoZWlnaHQ9IjE5MiIgdmlld0JveD0iMCAwIDE5MiAxOTIiIGZpbGw9Im5vbmUiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjxyZWN0IHdpZHRoPSIxOTIiIGhlaWdodD0iMTkyIiBmaWxsPSIjRkY2OUJGIi8+CjxwYXRoIGQ9Ik0xNDAgNjBDMTQwIDUxLjQ0OCA4Ni43NjMgNDggNjAuNSA2MEMzNC4yMzcgNjIgMjQgNzAuNDQ4IDI0IDk2QzI0IDEyMS41NTIgNzcuMjM3IDEyNCAxMDMuNSA1QzEyOS43NjMgMTI2IDE0MCAxMTcuNTUyIDE0MCA5NkMxNDAgNzAuNDQ4IDEyOS43NjMgNjIgMTQwIDYwWiIgZmlsbD0id2hpdGUiLz4KPC9zdmc+', 'sizes': '192x192'}]
    }">
    
    <style>
        :root {
            --purple: #c084fc;
            --blue: #7dd3fc;
            --mint: #86efac;
            --yellow: #fde68a;
            --peach: #fed7aa;
            --lavender: #f3e8ff;
            --mint-light: #f0fdf4;
            --peach-light: #fff7ed;
            --white: #ffffff;
            --gray-light: #f8fafc;
            --gray-text: #64748b;
            --shadow: 0 4px 20px rgba(0,0,0,0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', -apple-system, BlinkMacSystemFont, sans-serif;
            background: linear-gradient(135deg, var(--lavender) 0%, var(--mint-light) 50%, var(--peach-light) 100%);
            min-height: 100vh;
            color: var(--gray-text);
            overflow-x: hidden;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        header {
            background: linear-gradient(135deg, var(--purple) 0%, var(--blue) 50%, var(--mint) 100%);
            color: var(--white);
            padding: 30px;
            border-radius: 25px;
            margin-bottom: 30px;
            box-shadow: var(--shadow);
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        header::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.2) 0%, transparent 70%);
            animation: rotate 20s linear infinite;
        }

        @keyframes rotate {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        header h1 {
            font-size: 32px;
            margin-bottom: 10px;
            position: relative;
            z-index: 1;
        }

        header p {
            font-size: 16px;
            opacity: 0.95;
            position: relative;
            z-index: 1;
        }

        .tabs {
            display: flex;
            gap: 12px;
            margin-bottom: 30px;
            flex-wrap: wrap;
            justify-content: center;
        }

        .tab-btn {
            padding: 14px 28px;
            border: none;
            border-radius: 30px;
            background: var(--white);
            color: var(--purple);
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: 0 4px 12px rgba(192, 132, 252, 0.2);
            backdrop-filter: blur(10px);
        }

        .tab-btn.active {
            background: linear-gradient(135deg, var(--purple), var(--blue));
            color: var(--white);
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(192, 132, 252, 0.4);
        }

        .tab-btn:hover:not(.active) {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(192, 132, 252, 0.3);
        }

        .tab-content {
            display: none;
        }

        .tab-content.active {
            display: block;
            animation: slideIn 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Profile Section */
        .profile-selector {
            text-align: center;
            margin-bottom: 30px;
        }

        .profile-tabs {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }

        .profile-btn {
            padding: 14px 32px;
            border: 3px solid var(--lavender);
            background: var(--white);
            color: var(--purple);
            border-radius: 25px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(192, 132, 252, 0.15);
        }

        .profile-btn.active {
            background: var(--purple);
            color: var(--white);
            border-color: var(--purple);
            transform: translateY(-2px);
        }

        /* Upload Section */
        .upload-section {
            background: var(--white);
            padding: 35px;
            border-radius: 25px;
            margin-bottom: 25px;
            box-shadow: var(--shadow);
            backdrop-filter: blur(20px);
        }

        .upload-area {
            border: 4px dashed var(--lavender);
            border-radius: 20px;
            padding: 50px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
            background: linear-gradient(135deg, rgba(243, 232, 255, 0.5), rgba(240, 253, 244, 0.5));
        }

        .upload-area:hover {
            background: linear-gradient(135deg, rgba(243, 232, 255, 0.7), rgba(240, 253, 244, 0.7));
            border-color: var(--purple);
            transform: scale(1.02);
        }

        .upload-area.drag-over {
            background: linear-gradient(135deg, var(--purple), var(--blue));
            border-color: var(--white);
            transform: scale(1.05);
            color: var(--white);
        }

        .upload-icon {
            font-size: 48px;
            margin-bottom: 20px;
            filter: drop-shadow(0 4px 8px rgba(192, 132, 252, 0.3));
        }

        .upload-text {
            color: var(--purple);
            font-weight: 700;
            font-size: 18px;
            margin-bottom: 20px;
        }

        .camera-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 16px 32px;
            background: linear-gradient(135deg, var(--purple), var(--blue));
            color: var(--white);
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-weight: 700;
            font-size: 16px;
            transition: all 0.3s ease;
            box-shadow: 0 6px 20px rgba(192, 132, 252, 0.4);
        }

        .camera-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 30px rgba(192, 132, 252, 0.5);
        }

        /* Gallery */
        .gallery {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(160px, 1fr));
            gap: 20px;
            margin-top: 25px;
        }

        .gallery-item {
            position: relative;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: var(--shadow);
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            cursor: pointer;
            background: var(--white);
        }

        .gallery-item:hover {
            transform: translateY(-10px) scale(1.05);
            box-shadow: 0 20px 40px rgba(0,0,0,0.2);
        }

        .gallery-item img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            display: block;
            transition: transform 0.4s ease;
        }

        .gallery-item:hover img {
            transform: scale(1.1);
        }

        .gallery-item-remove {
            position: absolute;
            top: 10px;
            right: 10px;
            background: rgba(239, 68, 68, 0.9);
            color: white;
            border: none;
            border-radius: 50%;
            width: 32px;
            height: 32px;
            cursor: pointer;
            font-size: 20px;
            font-weight: bold;
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(239, 68, 68, 0.4);
        }

        .gallery-item:hover .gallery-item-remove {
            opacity: 1;
            transform: scale(1.1);
        }

        /* Outfit Creator */
        .outfit-creator {
            background: var(--white);
            padding: 35px;
            border-radius: 25px;
            box-shadow: var(--shadow);
            backdrop-filter: blur(20px);
        }

        .outfit-canvas {
            background: linear-gradient(135deg, var(--lavender), var(--mint-light));
            border-radius: 20px;
            padding: 30px;
            min-height: 350px;
            display: flex;
            flex-wrap: wrap;
            align-content: flex-start;
            gap: 15px;
            margin-bottom: 25px;
            border: 3px solid rgba(192, 132, 252, 0.2);
            position: relative;
            overflow: hidden;
        }

        .outfit-canvas::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: radial-gradient(circle at 20% 80%, rgba(192, 132, 252, 0.1) 0%, transparent 50%),
                        radial-gradient(circle at 80% 20%, rgba(125, 211, 252, 0.1) 0%, transparent 50%);
            pointer-events: none;
        }

        .outfit-item {
            position: relative;
            width: 140px;
            height: 170px;
            background: var(--white);
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
            cursor: grab;
            transition: all 0.3s ease;
            z-index: 1;
        }

        .outfit-item:active {
            cursor: grabbing;
        }

        .outfit-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .outfit-item-remove {
            position: absolute;
            top: 8px;
            right: 8px;
            background: rgba(239, 68, 68, 0.9);
            color: white;
            border: none;
            border-radius: 50%;
            width: 28px;
            height: 28px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transition: all 0.3s ease;
        }

        .outfit-item:hover .outfit-item-remove {
            opacity: 1;
        }

        .outfit-items-selector {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(100px, 1fr));
            gap: 15px;
            margin-top: 25px;
            max-height: 250px;
            overflow-y: auto;
            padding: 20px;
            background: var(--gray-light);
            border-radius: 20px;
            border: 2px solid rgba(192, 132, 252, 0.2);
        }

        .outfit-selector-item {
            width: 100%;
            height: 120px;
            border-radius: 15px;
            overflow: hidden;
            cursor: pointer;
            border: 3px solid transparent;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .outfit-selector-item:hover {
            border-color: var(--purple);
            transform: scale(1.08);
            box-shadow: 0 8px 25px rgba(192, 132, 252, 0.3);
        }

        .outfit-selector-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Calendar */
        .calendar-container {
            background: var(--white);
            padding: 35px;
            border-radius: 25px;
            box-shadow: var(--shadow);
        }

        .calendar-grid {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            gap: 15px;
            margin-bottom: 25px;
        }

        .calendar-day {
            aspect-ratio: 1;
            background: linear-gradient(135deg, var(--lavender), var(--mint-light));
            border: 3px solid rgba(192, 132, 252, 0.3);
            border-radius: 15px;
            padding: 12px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            font-weight: 600;
        }

        .calendar-day:hover {
            transform: translateY(-5px) scale(1.05);
            border-color: var(--purple);
            box-shadow: 0 10px 30px rgba(192, 132, 252, 0.3);
        }

        .calendar-day.selected {
            background: linear-gradient(135deg, var(--purple), var(--blue));
            color: var(--white);
            border-color: var(--white);
        }

        .calendar-day-outfit {
            width: 50px;
            height: 50px;
            border-radius: 10px;
            overflow: hidden;
            margin: 8px auto 0;
            border: 2px solid var(--white);
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }

        /* Friends Grid */
        .friends-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
            gap: 25px;
            margin-bottom: 30px;
        }

        .friend-card {
            background: var(--white);
            border-radius: 25px;
            padding: 25px;
            text-align: center;
            box-shadow: var(--shadow);
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            cursor: pointer;
            border: 4px solid transparent;
            position: relative;
            overflow: hidden;
        }

        .friend-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, var(--purple), var(--blue), var(--mint));
        }

        .friend-card:hover {
            transform: translateY(-10px);
            border-color: var(--purple);
            box-shadow: 0 20px 40px rgba(192, 132, 252, 0.3);
        }

        .friend-avatar {
            width: 90px;
            height: 90px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--purple), var(--blue));
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 45px;
            margin: 0 auto 15px;
            border: 4px solid var(--white);
            box-shadow: 0 8px 25px rgba(192, 132, 252, 0.4);
            transition: all 0.3s ease;
        }

        .friend-card:hover .friend-avatar {
            transform: scale(1.1) rotate(5deg);
        }

        .friend-name {
            font-weight: 700;
            color: var(--purple);
            margin-bottom: 8px;
            font-size: 18px;
            cursor: text;
            padding: 8px;
            border-radius: 10px;
            transition: background 0.3s ease;
        }

        .friend-name.editing {
            background: var(--lavender);
            border: 2px solid var(--purple);
        }

        .friend-stats {
            font-size: 14px;
            color: var(--gray-text);
            background: rgba(192, 132, 252, 0.1);
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: 600;
        }

        /* Feed */
        .feed-container {
            max-width: 700px;
            margin: 0 auto;
        }

        .feed-post {
            background: var(--white);
            border-radius: 25px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow: var(--shadow);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255,255,255,0.2);
        }

        .post-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            gap: 15px;
        }

        .post-avatar {
            width: 55px;
            height: 55px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--purple), var(--blue));
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
            border: 3px solid var(--white);
            box-shadow: 0 6px 20px rgba(192, 132, 252, 0.4);
        }

        .post-name {
            font-weight: 700;
            color: var(--purple);
            font-size: 18px;
        }

        .post-time {
            font-size: 14px;
            color: var(--gray-text);
            margin-left: auto;
        }

        .post-content {
            background: linear-gradient(135deg, var(--lavender), var(--mint-light));
            border-radius: 20px;
            padding: 20px;
            margin-bottom: 20px;
            border: 2px solid rgba(192, 132, 252, 0.2);
        }

        .post-outfits {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
            gap: 12px;
            margin-top: 15px;
        }

        .post-outfit-item {
            width: 100%;
            height: 140px;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
        }

        .post-engagement {
            display: flex;
            gap: 15px;
            padding-top: 15px;
            border-top: 1px solid rgba(192, 132, 252, 0.2);
        }

        .engagement-btn {
            flex: 1;
            padding: 12px 20px;
            background: transparent;
            border: 2px solid rgba(192, 132, 252, 0.2);
            color: var(--gray-text);
            cursor: pointer;
            border-radius: 20px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .engagement-btn:hover, .engagement-btn.active {
            background: var(--purple);
            color: var(--white);
            border-color: var(--purple);
            transform: translateY(-2px);
        }

        /* Inputs */
        .outfit-date-input {
            width: 100%;
            padding: 16px;
            border: 3px solid rgba(192, 132, 252, 0.3);
            border-radius: 15px;
            margin-bottom: 20px;
            font-size: 16px;
            background: var(--white);
            transition: all 0.3s ease;
        }

        .outfit-date-input:focus {
            outline: none;
            border-color: var(--purple);
            box-shadow: 0 0 0 4px rgba(192, 132, 252, 0.2);
        }

        .save-outfit-btn {
            width: 100%;
            padding: 20px;
            background: linear-gradient(135deg, var(--purple), var(--blue));
            color: var(--white);
            border: none;
            border-radius: 20px;
            font-weight: 700;
            cursor: pointer;
            font-size: 18px;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: 0 8px 25px rgba(192, 132, 252, 0.4);
        }

        .save-outfit-btn:hover {
            transform: translateY(-4px);
            box-shadow: 0 15px 40px rgba(192, 132, 252, 0.5);
        }

        /* Mobile */
        @media (max-width: 768px) {
            .container { padding: 15px; }
            header h1 { font-size: 24px; }
            .tabs { gap: 8px; flex-direction: column; }
            .tab-btn { padding: 12px 20px; font-size: 14px; }
            .gallery { grid-template-columns: repeat(auto-fill, minmax(130px, 1fr)); gap: 15px; }
            .friends-grid { grid-template-columns: repeat(auto-fill, minmax(140px, 1fr)); }
        }

        /* Scrollbar */
        ::-webkit-scrollbar {
            width: 8px;
        }

        ::-webkit-scrollbar-track {
            background: rgba(192, 132, 252, 0.1);
            border-radius: 10px;
        }

        ::-webkit-scrollbar-thumb {
            background: var(--purple);
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>👗 Closet Social 🌈</h1>
            <p>¡Comparte estilo con tus amigas en colores pastel!</p>
        </header>

        <div class="tabs">
            <button class="tab-btn active" onclick="switchTab('mi-closet')">👚 Mi Closet</button>
            <button class="tab-btn" onclick="switchTab('feed')">📱 Feed</button>
            <button class="tab-btn" onclick="switchTab('amigas')">👭 Amigas</button>
            <button class="tab-btn" onclick="switchTab('crear-outfit')">✨ Crear</button>
            <button class="tab-btn" onclick="switchTab('calendario')">📅 Calendario</button>
        </div>

        <!-- MI CLOSET -->
        <div id="mi-closet" class="tab-content active">
            <div class="profile-selector">
                <div class="profile-tabs">
                    <button class="profile-btn active" onclick="switchProfile('tu')">💖 Tú</button>
                </div>
            </div>

            <div class="upload-section">
                <h2 style="margin-bottom: 25px; color: var(--purple); font-size: 24px;">📸 Sube tu Ropa</h2>
                <div class="upload-area" id="uploadArea" onclick="document.getElementById('photoInput').click();">
                    <div class="upload-icon">📷</div>
                    <div class="upload-text">Toca o arrastra fotos aquí ✨</div>
                    <button class="camera-btn" onclick="event.stopPropagation(); takePicture();">📱 Cámara</button>
                    <input type="file" id="photoInput" accept="image/*" multiple onchange="uploadPhoto(event)">
                </div>
                <input type="file" id="cameraInput" accept="image/*" capture="environment" style="display: none;" multiple onchange="uploadPhoto(event)">
            </div>

            <div id="galleriaContainer">
                <h3 style="color: var(--purple); margin-top: 20px; font-size: 22px;">Tu Galería ✨</h3>
                <div id="gallery" class="gallery"></div>
            </div>
        </div>

        <!-- CREAR OUTFIT -->
        <div id="crear-outfit" class="tab-content">
            <div class="outfit-creator">
                <h2 style="margin-bottom: 25px; color: var(--purple); font-size: 28px;">✨ Crea Outfit Mágico</h2>
                
                <label style="color: var(--purple); font-weight: 700; font-size: 18px; display: block; margin-bottom: 15px;">🎨 Canvas:</label>
                <div class="outfit-canvas" id="outfitCanvas"></div>

                <label style="color: var(--purple); font-weight: 700; font-size: 18px; display: block; margin: 25px 0 15px;">👗 Prendas disponibles:</label>
                <div class="outfit-items-selector" id="outfitSelector"></div>

                <div style="display: flex; gap: 15px; margin-top: 25px;">
                    <input type="date" id="outfitDate" class="outfit-date-input">
                    <button class="save-outfit-btn" onclick="saveOutfit()" style="flex: 1;">💾 Guardar Look</button>
                </div>
            </div>
        </div>

        <!-- CALENDARIO -->
        <div id="calendario" class="tab-content">
            <div class="calendar-container">
                <h2 style="margin-bottom: 25px; color: var(--purple); font-size: 28px;">📅 Tus Looks</h2>
                
                <div style="text-align: center; margin-bottom: 25px;">
                    <label style="color: var(--purple); font-weight: 700; margin-right: 15px; font-size: 16px;">Mes:</label>
                    <select id="monthSelect" onchange="updateCalendar()" style="padding: 12px 20px; border: 3px solid rgba(192, 132, 252, 0.3); border-radius: 15px; font-size: 16px; background: var(--white);">
                        <option value="0">Enero</option><option value="1">Febrero</option><option value="2">Marzo</option>
                        <option value="3">Abril</option><option value="4">Mayo</option><option value="5">Junio</option>
                        <option value="6">Julio</option><option value="7">Agosto</option><option value="8">Septiembre</option>
                        <option value="9">Octubre</option><option value="10">Noviembre</option><option value="11">Diciembre</option>
                    </select>
                </div>

                <div class="calendar-grid" id="calendarGrid"></div>
                <div id="selectedOutfitDisplay" style="margin-top: 30px;"></div>
            </div>
        </div>

        <!-- FEED -->
        <div id="feed" class="tab-content">
            <div class="feed-container" id="feedContainer"></div>
        </div>

        <!-- AMIGAS -->
        <div id="amigas" class="tab-content">
            <div class="friend-closet">
                <div style="text-align: center; margin-bottom: 30px;">
                    <h2 style="color: var(--purple); font-size: 28px;">👭 Tus Amigas</h2>
                    <p style="color: var(--gray-text); font-size: 16px;">Edita sus nombres tocando arriba</p>
                </div>
                <div id="friendsGrid" class="friends-grid"></div>
            </div>

            <div id="selectedFriendCloset" style="display: none;">
                <button class="tab-btn" onclick="closeFriendView()" style="margin-bottom: 25px; display: inline-flex; align-items: center; gap: 10px;">
                    ← Volver a Amigas
                </button>
                <div id="friendClosetContent"></div>
            </div>
        </div>
    </div>

    <script>
        // Estado completo de la app
        const state = {
            currentProfile: 'tu',
            photos: { tu: [] },
            outfits: [],
            friends: [
                { id: 1, name: 'Usuario 1', emoji: '😊', color: '#c084fc', photos: [], outfits: [] },
                { id: 2, name: 'Usuario 2', emoji: '🎨', color: '#7dd3fc', photos: [], outfits: [] },
                { id: 3, name: 'Usuario 3', emoji: '✨', color: '#86efac', photos: [], outfits: [] },
                { id: 4, name: 'Usuario 4', emoji: '🌸', color: '#fde68a', photos: [], outfits: [] },
                { id: 5, name: 'Usuario 5', emoji: '💫', color: '#fed7aa', photos: [], outfits: [] },
                { id: 6, name: 'Usuario 6', emoji: '🦋', color: '#c084fc', photos: [], outfits: [] },
                { id: 7, name: 'Usuario 7', emoji: '🌺', color: '#7dd3fc', photos: [], outfits: [] },
                { id: 8, name: 'Usuario 8', emoji: '👑', color: '#86efac', photos: [], outfits: [] },
                { id: 9, name: 'Usuario 9', emoji: '🌹', color: '#fde68a', photos: [], outfits: [] },
                { id: 10, name: 'Usuario 10', emoji: '💖', color: '#fed7aa', photos: [], outfits: [] }
            ],
            selectedFriend: null,
            editingFriend: null
        };

        // Inicialización
        document.addEventListener('DOMContentLoaded', () => {
            setupDragAndDrop();
            updateGallery();
            updateCalendar();
            updateFriendsGrid();
            updateFeed();
            setCurrentDate();
            
            // Guardar en localStorage
            window.addEventListener('beforeunload', saveToLocalStorage);
            loadFromLocalStorage();
        });

        // Tabs
        function switchTab(tabName) {
            document.querySelectorAll('.tab-content').forEach(el => el.classList.remove('active'));
            document.getElementById(tabName).classList.add('active');
            document.querySelectorAll('.tab-btn').forEach(btn => btn.classList.remove('active'));
            event.target.classList.add('active');
            
            if (tabName === 'crear-outfit') updateOutfitSelector();
            if (tabName === 'feed') updateFeed();
        }

        // Profile switch (solo tú por ahora)
        function switchProfile(profile) {
            state.currentProfile = profile;
            document.querySelectorAll('.profile-btn').forEach(btn => btn.classList.remove('active'));
            event.target.classList.add('active');
            updateGallery();
        }

        // Amigas
        function openFriendCloset(friendId) {
            const friend = state.friends.find(f => f.id === friendId);
            state.selectedFriend = friend;
            document.getElementById('friendsGrid').style.display = 'none';
            document.getElementById('selectedFriendCloset').style.display = 'block';
            renderFriendCloset(friend);
        }

        function closeFriendView() {
            state.selectedFriend = null;
            document.getElementById('friendsGrid').style.display = 'grid';
            document.getElementById('selectedFriendCloset').style.display = 'none';
        }

        function renderFriendCloset(friend) {
            const content = document.getElementById('friendClosetContent');
            content.innerHTML = `
                <div style="background: var(--white); padding: 35px; border-radius: 25px; box-shadow: var(--shadow); margin-bottom: 25px;">
                    <div style="text-align: center; margin-bottom: 30px;">
                        <div style="width: 120px; height: 120px; border-radius: 50%; background: linear-gradient(135deg, ${friend.color}, #fff); 
                                    display: flex; align-items: center; justify-content: center; font-size: 60px; margin: 0 auto 20px; 
                                    border: 5px solid var(--white); box-shadow: 0 12px 40px ${friend.color.replace('0.4', '0.4')}">
                            ${friend.emoji}
                        </div>
                        <h2 style="color: ${friend.color}; font-size: 32px; margin-bottom: 10px;">${friend.name}</h2>
                        <p style="font-size: 18px; color: var(--gray-text);">${friend.photos.length} prendas • ${friend.outfits.length} outfits</p>
                    </div>

                    <div style="margin-bottom: 35px;">
                        <h3 style="color: ${friend.color}; font-size: 24px; margin-bottom: 20px;">📸 Su Ropa</h3>
                        <div class="gallery" id="friendPhotosGallery">
                            ${friend.photos.map((photo, idx) => `
                                <div class="gallery-item" onclick="addToOutfitCanvas('${photo}')">
                                    <img src="${photo}" alt="Prenda">
                                </div>
                            `).join('')}
                        </div>
                        ${friend.photos.length === 0 ? '<p style="text-align: center; color: var(--gray-text); padding: 30px; font-size: 18px;">Aún no tiene fotos 😊</p>' : ''}
                    </div>

                    <div>
                        <h3 style="color: ${friend.color}; font-size: 24px; margin-bottom: 20px;">💝 Outfits para ${friend.name}</h3>
                        <div class="shared-outfits" style="display: grid; grid-template-columns: repeat(auto-fill, minmax(220px, 1fr)); gap: 20px;">
                            ${friend.outfits.map(outfit => `
                                <div class="outfit-card" style="background: var(--white); border-radius: 20px; padding: 20px; box-shadow: var(--shadow);">
                                    <div style="display: flex; flex-wrap: wrap; gap: 10px; justify-content: center; margin-bottom: 15px;">
                                        ${outfit.items.slice(0, 4).map(item => `
                                            <div style="width: 80px; height: 100px; border-radius: 12px; overflow: hidden; box-shadow: 0 4px 12px rgba(0,0,0,0.15);">
                                                <img src="${item}" style="width: 100%; height: 100%; object-fit: cover;">
                                            </div>
                                        `).join('')}
                                    </div>
                                    <div style="text-align: center;">
                                        <div style="color: ${friend.color}; font-weight: 700; font-size: 14px;">${new Date(outfit.date).toLocaleDateString('es-ES', {day: 'numeric', month: 'short'})}</div>
                                        <div style="color: var(--gray-text);">${outfit.items.length} prendas</div>
                                    </div>
                                </div>
                            `).join('')}
                        </div>
                        ${friend.outfits.length === 0 ? '<p style="text-align: center; color: var(--gray-text); padding: 40px; font-size: 18px;">¡Crea el primer outfit para ' + friend.name + '! 💕</p>' : ''}
                    </div>

                    <div style="margin-top: 35px; text-align: center;">
                        <button class="save-outfit-btn" onclick="switchTab('crear-outfit'); closeFriendView();" style="max-width: 350px; font-size: 18px;">
                            ✨ Crear outfit para ${friend.name}
                        </button>
                    </div>
                </div>
            `;
        }

        // Drag & Drop
        function setupDragAndDrop() {
            const uploadArea = document.getElementById('uploadArea');
            ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
                uploadArea.addEventListener(eventName, preventDefaults, false);
            });
            ['dragenter', 'dragover'].forEach(eventName => {
                uploadArea.addEventListener(eventName, highlight, false);
            });
            ['dragleave', 'drop'].forEach(eventName => {
                uploadArea.addEventListener(eventName, unhighlight, false);
            });
            uploadArea.addEventListener('drop', handleDrop, false);
        }

        function preventDefaults(e) { e.preventDefault(); e.stopPropagation(); }
        function highlight(e) { document.getElementById('uploadArea').classList.add('drag-over'); }
        function unhighlight(e) { document.getElementById('uploadArea').classList.remove('drag-over'); }

        function handleDrop(e) {
            const dt = e.dataTransfer;
            const files = dt.files;
            handleFiles(files);
        }

        function uploadPhoto(event) {
            handleFiles(event.target.files);
        }

        function handleFiles(files) {
            Array.from(files).forEach(file => {
                if (file.type.startsWith('image/') && file.size < 10 * 1024 * 1024) { // 10MB limit
                    const reader = new FileReader();
                    reader.onload = (e) => {
                        state.photos.tu.push(e.target.result);
                        updateGallery();
                        updateOutfitSelector();
                        saveToLocalStorage();
                    };
                    reader.readAsDataURL(file);
                }
            });
        }

        function takePicture() {
            document.getElementById('cameraInput').click();
        }

        // Gallery
        function updateGallery() {
            const gallery = document.getElementById('gallery');
            const photos = state.photos.tu;
            gallery.innerHTML = photos.map((photo, idx) => `
                <div class="gallery-item">
                    <img src="${photo}" alt="Prenda ${idx + 1}">
                    <button class="gallery-item-remove" onclick="removePhoto(${idx}); event.stopPropagation();">×</button>
                </div>
            `).join('');
        }

        function removePhoto(index) {
            state.photos.tu.splice(index, 1);
            updateGallery();
            updateOutfitSelector();
            updateFeed();
            saveToLocalStorage();
        }

        // Friends Grid
        function updateFriendsGrid() {
            const grid = document.getElementById('friendsGrid');
            grid.innerHTML = state.friends.map(friend => `
                <div class="friend-card" onclick="openFriendCloset(${friend.id})" style="--friend-color: ${friend.color}">
                    <div class="friend-avatar" style="background: linear-gradient(135deg, ${friend.color}, ${friend.color}cc);">${friend.emoji}</div>
                    <div class="friend-name" ondblclick="editFriendName(${friend.id})">${friend.name}</div>
                    <div class="friend-stats">${friend.photos.length} prendas • ${friend.outfits.length} looks</div>
                </div>
            `).join('');
        }

        function editFriendName(friendId) {
            const friend = state.friends.find(f => f.id === friendId);
            const nameEl = event.target;
            const currentName = friend.name;
            
            const input = document.createElement('input');
            input.type = 'text';
            input.value = currentName;
            input.style.cssText = `
                width: 100%; padding: 8px 12px; border: 2px solid var(--purple); 
                border-radius: 10px; font-size: 18px; font-weight: 700; text-align: center;
                background: var(--lavender);
            `;
            input.classList.add('friend-name', 'editing');
            
            nameEl.replaceWith(input);
            input.focus();
            input.select();
            
            input.onblur = () => {
                const newName = input.value.trim() || 'Usuario ' + friend.id;
                friend.name = newName;
                input.replaceWith(document.createTextNode(newName));
                updateFriendsGrid();
                updateFeed();
                saveToLocalStorage();
            };
            
            input.onkeypress = (e) => {
                if (e.key === 'Enter') input.blur();
            };
        }

        // Outfit Creator
        function updateOutfitSelector() {
            const selector = document.getElementById('outfitSelector');
            const photos = [...state.photos.tu, ...state.selectedFriend?.photos || []];
            selector.innerHTML = photos.map((photo, idx) => `
                <div class="outfit-selector-item" onclick="addToOutfitCanvas('${photo}')">
                    <img src="${photo}" alt="Prenda">
                </div>
            `).join('');
        }

        function addToOutfitCanvas(photoUrl) {
            const canvas = document.getElementById('outfitCanvas');
            const existing = Array.from(canvas.querySelectorAll('img')).some(img => img.src === photoUrl);
            if (existing) return;
            
            const item = document.createElement('div');
            item.className = 'outfit-item';
            item.draggable = true;
            item.innerHTML = `
                <img src="${photoUrl}" alt="Prenda">
                <button class="outfit-item-remove" onclick="this.parentElement.remove(); event.stopPropagation();">×</button>
            `;
            
            item.addEventListener('dragstart', (e) => {
                item.classList.add('dragging');
                e.dataTransfer.effectAllowed = 'move';
            });
            item.addEventListener('dragend', () => item.classList.remove('dragging'));
            
            canvas.appendChild(item);
        }

        function saveOutfit() {
            const canvas = document.getElementById('outfitCanvas');
            const items = Array.from(canvas.querySelectorAll('.outfit-item img'));
            const date = document.getElementById('outfitDate').value;

            if (items.length === 0) {
                alert('¡Añade al menos una prenda! 👗');
                return;
            }
            if (!date) {
                alert('¡Selecciona una fecha! 📅');
                return;
            }

            const outfit = {
                id: Date.now(),
                date: date,
                items: items.map(img => img.src)
            };

            if (state.selectedFriend) {
                state.selectedFriend.outfits.push(outfit);
                alert(`¡Look guardado para ${state.selectedFriend.name}! 💖`);
            } else {
                state.outfits.push(outfit);
                alert('¡Tu look está listo! ✨');
            }

            canvas.innerHTML = '';
            document.getElementById('outfitDate').value = '';
            updateCalendar();
            updateFeed();
            updateFriendsGrid();
            saveToLocalStorage();
        }

        // Feed
        function updateFeed() {
            const feedContainer = document.getElementById('feedContainer');
            const allPosts = [];
            
            // Tus outfits
            state.outfits.forEach(outfit => {
                allPosts.push({
                    type: 'outfit',
                    author: 'Tú',
                    avatar: '👋',
                    color: '#c084fc',
                    date: new Date(outfit.date),
                    items: outfit.items,
                    caption: `Nuevo look del ${new Date(outfit.date).toLocaleDateString('es-ES', {day: 'numeric', month: 'long'})}`
                });
            });

            // Outfits de amigas
            state.friends.forEach(friend => {
                friend.outfits.forEach(outfit => {
                    allPosts.push({
                        type: 'outfit',
                        author: friend.name,
                        avatar: friend.emoji,
                        color: friend.color,
                        date: new Date(outfit.date),
                        items: outfit.items,
                        caption: `Nuevo look del ${new Date(outfit.date).toLocaleDateString('es-ES', {day: 'numeric', month: 'long'})}`
                    });
                });
            });

            allPosts.sort((a, b) => b.date - a.date);

            if (allPosts.length === 0) {
                feedContainer.innerHTML = `
                    <div style="text-align: center; padding: 60px 20px;">
                        <div style="font-size: 48px; margin-bottom: 20px;">✨</div>
                        <h3 style="color: var(--purple); font-size: 24px; margin-bottom: 15px;">¡Tu feed está vacío!</h3>
                        <p style="color: var(--gray-text); font-size: 18px;">Crea outfits para ver magia aquí 👗</p>
                    </div>
                `;
            } else {
                feedContainer.innerHTML = allPosts.map(post => `
                    <div class="feed-post">
                        <div class="post-header">
                            <div class="post-avatar" style="background: linear-gradient(135deg, ${post.color}, ${post.color}cc);">${post.avatar}</div>
                            <div style="flex: 1;">
                                <div class="post-name">${post.author}</div>
                                <div class="post-time">${post.date.toLocaleDateString('es-ES', {weekday: 'short', day: 'numeric', month: 'short'})}</div>
                            </div>
                        </div>
                        <div class="post-content">
                            <p style="margin-bottom: 15px; font-size: 16px;">${post.caption}</p>
                            <div class="post-outfits">
                                ${post.items.slice(0, 6).map(item => `
                                    <div class="post-outfit-item">
                                        <img src="${item}" alt="Prenda">
                                    </div>
                                `).join('')}
                            </div>
                        </div>
                        <div class="post-engagement">
                            <button class="engagement-btn" onclick="this.classList.toggle('active')">❤️ ${Math.floor(Math.random()*100)}</button>
                            <button class="engagement-btn" onclick="this.classList.toggle('active')">💬 Comentar</button>
                            <button class="engagement-btn" onclick="this.classList.toggle('active')">✨ Inspirar</button>
                        </div>
                    </div>
                `).join('');
            }
        }

        // Calendar
        function setCurrentDate() {
            const today = new Date();
            const year = today.getFullYear();
            const month = String(today.getMonth() + 1).padStart(2, '0');
            const day = String(today.getDate()).padStart(2, '0');
            document.getElementById('outfitDate').value = `${year}-${month}-${day}`;
            document.getElementById('monthSelect').value = today.getMonth();
            updateCalendar();
        }

        function updateCalendar() {
            const monthSelect = document.getElementById('monthSelect');
            const month = parseInt(monthSelect.value);
            const year = new Date().getFullYear();
            const firstDay = new Date(year, month, 1).getDay();
            const daysInMonth = new Date(year, month + 1, 0).getDate();
            
            const calendarGrid = document.getElementById('calendarGrid');
            calendarGrid.innerHTML = '';

            for (let i = 0; i < firstDay; i++) {
                const emptyCell = document.createElement('div');
                calendarGrid.appendChild(emptyCell);
            }

            for (let day = 1; day <= daysInMonth; day++) {
                const dayCell = document.createElement('div');
                dayCell.className = 'calendar-day';
                const dateStr = `${year}-${String(month + 1).padStart(2, '0')}-${String(day).padStart(2, '0')}`;
                const outfit = state.outfits.find(o => o.date === dateStr);
                
                dayCell.innerHTML = `<div style="margin-bottom: 5px;">${day}</div>`;
                if (outfit?.items.length) {
                    dayCell.innerHTML += `<div class="calendar-day-outfit"><img src="${outfit.items[0]}"></div>`;
                    dayCell.classList.add('selected');
                }
                
                dayCell.onclick = () => showOutfitForDate(dateStr);
                calendarGrid.appendChild(dayCell);
            }
        }

        function showOutfitForDate(date) {
            const outfit = state.outfits.find(o => o.date === date);
            const display = document.getElementById('selectedOutfitDisplay');
            
            if (outfit) {
                display.innerHTML = `
                    <h3 style="color: var(--purple); margin-bottom: 25px; font-size: 28px; text-align: center;">
                        Look del ${new Date(date).toLocaleDateString('es-ES', {day: 'numeric', month: 'long'})}
                    </h3>
                    <div class="gallery" style="grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));">
                        ${outfit.items.map(item => `
                            <div class="gallery-item" style="cursor: default; transform: none;">
                                <img src="${item}" style="height: 180px;">
                            </div>
                        `).join('')}
                    </div>
                `;
            } else {
                display.innerHTML = `
                    <div style="text-align: center; padding: 40px; color: var(--gray-text);">
                        <div style="font-size: 48px; margin-bottom: 20px;">💭</div>
                        <p style="font-size: 20px;">Sin look para este día</p>
                    </div>
                `;
            }
        }

        // LocalStorage
        function saveToLocalStorage() {
            localStorage.setItem('closetSocial', JSON.stringify({
                photos: state.photos,
                outfits: state.outfits,
                friends: state.friends
            }));
        }

        function loadFromLocalStorage() {
            const saved = localStorage.getItem('closetSocial');
            if (saved) {
                const data = JSON.parse(saved);
                state.photos = data.photos || state.photos;
                state.outfits = data.outfits || [];
                state.friends = data.friends || state.friends;
                updateGallery();
                updateFriendsGrid();
                updateFeed();
            }
        }
    </script>
</body>
</html>
