// Settings Page JavaScript

let userSettings = {
    displayName: 'Memento User',
    email: 'user@memento.app',
    timezone: 'UTC',
    dateFormat: 'MM/DD/YYYY',
    theme: 'light',
    accentColor: 'sage',
    notifications: {
        messageReminders: true,
        birthdayReminders: true,
        achievementNotifications: true,
        dailyQuests: true
    },
    privacy: {
        dataEncryption: true,
        analytics: false,
        autoLock: false
    }
};

let labels = [
    { id: '1', name: 'Family', color: 'blue', usage: 8 },
    { id: '2', name: 'Work', color: 'green', usage: 12 },
    { id: '3', name: 'Friends', color: 'purple', usage: 6 },
    { id: '4', name: 'Networking', color: 'yellow', usage: 4 },
    { id: '5', name: 'Clients', color: 'red', usage: 9 }
];

let selectedLabelColor = 'blue';

document.addEventListener('DOMContentLoaded', function() {
    loadSettings();
    setupEventListeners();
    renderLabels();
    animateElements();
});

function loadSettings() {
    // Load from localStorage or use defaults
    const storedSettings = localStorage.getItem('userSettings');
    if (storedSettings) {
        userSettings = { ...userSettings, ...JSON.parse(storedSettings) };
    }
    
    // Populate form fields
    document.getElementById('display-name').value = userSettings.displayName;
    document.getElementById('user-email').value = userSettings.email;
    document.getElementById('timezone').value = userSettings.timezone;
    document.getElementById('date-format').value = userSettings.dateFormat;
    
    // Set theme
    document.querySelector(`[data-theme="${userSettings.theme}"]`).classList.add('active');
    
    // Set accent color
    document.querySelector(`[data-color="${userSettings.accentColor}"]`).style.border = '2px solid #87A96B';
    
    // Set notification toggles
    document.getElementById('message-reminders').checked = userSettings.notifications.messageReminders;
    document.getElementById('birthday-reminders').checked = userSettings.notifications.birthdayReminders;
    document.getElementById('achievement-notifications').checked = userSettings.notifications.achievementNotifications;
    document.getElementById('daily-quests').checked = userSettings.notifications.dailyQuests;
    
    // Set privacy toggles
    document.getElementById('data-encryption').checked = userSettings.privacy.dataEncryption;
    document.getElementById('analytics').checked = userSettings.privacy.analytics;
    document.getElementById('auto-lock').checked = userSettings.privacy.autoLock;
}

function setupEventListeners() {
    // Profile settings
    document.getElementById('save-profile').addEventListener('click', saveProfileSettings);
    
    // Theme selection
    const themeOptions = document.querySelectorAll('.theme-option');
    themeOptions.forEach(option => {
        option.addEventListener('click', function() {
            selectTheme(this.dataset.theme);
        });
    });
    
    // Accent color selection
    const colorButtons = document.querySelectorAll('[data-color]');
    colorButtons.forEach(button => {
        button.addEventListener('click', function() {
            selectAccentColor(this.dataset.color);
        });
    });
    
    // Toggle switches
    const toggles = document.querySelectorAll('.toggle-switch input');
    toggles.forEach(toggle => {
        toggle.addEventListener('change', handleToggleChange);
    });
    
    // Label management
    document.getElementById('add-label-btn').addEventListener('click', openAddLabelModal);
    document.getElementById('cancel-add-label').addEventListener('click', closeAddLabelModal);
    document.getElementById('add-label-form').addEventListener('submit', handleAddLabel);
    
    // Color selection for labels
    const colorOptions = document.querySelectorAll('.color-option');
    colorOptions.forEach(option => {
        option.addEventListener('click', function() {
            selectLabelColor(this.dataset.color);
        });
    });
    
    // Data management
    document.getElementById('export-all').addEventListener('click', () => exportData('all'));
    document.getElementById('export-mementos').addEventListener('click', () => exportData('mementos'));
    document.getElementById('export-settings').addEventListener('click', () => exportData('settings'));
    
    // Import functionality
    document.getElementById('browse-import').addEventListener('click', () => {
        document.getElementById('import-file').click();
    });
    document.getElementById('import-file').addEventListener('change', handleImportFile);
    
    // Drop zone for imports
    const dropZone = document.getElementById('import-drop-zone');
    dropZone.addEventListener('dragover', handleDragOver);
    dropZone.addEventListener('dragleave', handleDragLeave);
    dropZone.addEventListener('drop', handleDrop);
    
    // Privacy & security
    document.getElementById('clear-data').addEventListener('click', confirmClearData);
    document.getElementById('reset-settings').addEventListener('click', confirmResetSettings);
}

function saveProfileSettings() {
    userSettings.displayName = document.getElementById('display-name').value;
    userSettings.email = document.getElementById('user-email').value;
    userSettings.timezone = document.getElementById('timezone').value;
    userSettings.dateFormat = document.getElementById('date-format').value;
    
    localStorage.setItem('userSettings', JSON.stringify(userSettings));
    
    showNotification('Profile settings saved successfully!', 'success');
}

function selectTheme(theme) {
    // Remove active class from all theme options
    document.querySelectorAll('.theme-option').forEach(option => {
        option.classList.remove('active');
    });
    
    // Add active class to selected theme
    document.querySelector(`[data-theme="${theme}"]`).classList.add('active');
    
    userSettings.theme = theme;
    localStorage.setItem('userSettings', JSON.stringify(userSettings));
    
    // Apply theme changes (in a real app, this would change CSS variables)
    showNotification('Theme updated successfully!', 'success');
}

function selectAccentColor(color) {
    // Remove border from all color buttons
    document.querySelectorAll('[data-color]').forEach(button => {
        button.style.border = '2px solid white';
    });
    
    // Add border to selected color
    document.querySelector(`[data-color="${color}"]`).style.border = '2px solid #87A96B';
    
    userSettings.accentColor = color;
    localStorage.setItem('userSettings', JSON.stringify(userSettings));
    
    showNotification('Accent color updated successfully!', 'success');
}

function handleToggleChange(event) {
    const toggle = event.target;
    const setting = toggle.id.replace(/-/g, '_');
    
    // Handle different setting categories
    if (setting.includes('reminder') || setting.includes('notification') || setting.includes('quests')) {
        userSettings.notifications[setting] = toggle.checked;
    } else if (setting.includes('encryption') || setting.includes('analytics') || setting.includes('lock')) {
        userSettings.privacy[setting] = toggle.checked;
    }
    
    localStorage.setItem('userSettings', JSON.stringify(userSettings));
    
    const settingName = toggle.id.replace(/-/g, ' ').replace(/\b\w/g, l => l.toUpperCase());
    showNotification(`${settingName} ${toggle.checked ? 'enabled' : 'disabled'}!`, 'success');
}

function renderLabels() {
    const container = document.getElementById('labels-container');
    
    if (labels.length === 0) {
        container.innerHTML = `
            <div class="text-center py-8">
                <div class="text-charcoal opacity-50 mb-4">
                    <svg class="w-12 h-12 mx-auto" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M17.707 9.293a1 1 0 010 1.414l-7 7a1 1 0 01-1.414 0l-7-7A.997.997 0 012 10V5a3 3 0 013-3h5c.256 0 .512.098.707.293l7 7zM5 6a1 1 0 100-2 1 1 0 000 2z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <p class="text-charcoal opacity-70">No labels created yet</p>
            </div>
        `;
        return;
    }
    
    container.innerHTML = labels.map(label => {
        const colorClasses = {
            blue: 'bg-blue-100 text-blue-800',
            green: 'bg-green-100 text-green-800',
            purple: 'bg-purple-100 text-purple-800',
            yellow: 'bg-yellow-100 text-yellow-800',
            red: 'bg-red-100 text-red-800',
            gray: 'bg-gray-100 text-gray-800'
        };
        
        const colorClass = colorClasses[label.color] || colorClasses.gray;
        
        return `
            <div class="label-chip ${colorClass}">
                <span>${label.name}</span>
                <span class="text-xs opacity-70">(${label.usage})</span>
                <button onclick="deleteLabel('${label.id}')" class="hover:opacity-70">
                    <svg class="w-3 h-3" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"/>
                    </svg>
                </button>
            </div>
        `;
    }).join('');
    
    // Animate labels
    anime({
        targets: '.label-chip',
        opacity: [0, 1],
        scale: [0.8, 1],
        delay: anime.stagger(50),
        duration: 400,
        easing: 'easeOutQuart'
    });
}

function openAddLabelModal() {
    const modal = document.getElementById('add-label-modal');
    modal.classList.remove('hidden');
    
    anime({
        targets: modal.querySelector('.bg-white'),
        scale: [0.8, 1],
        opacity: [0, 1],
        duration: 300,
        easing: 'easeOutQuart'
    });
}

function closeAddLabelModal() {
    const modal = document.getElementById('add-label-modal');
    
    anime({
        targets: modal.querySelector('.bg-white'),
        scale: [1, 0.8],
        opacity: [1, 0],
        duration: 200,
        easing: 'easeInQuart',
        complete: () => {
            modal.classList.add('hidden');
            document.getElementById('add-label-form').reset();
            selectedLabelColor = 'blue';
            updateColorSelection();
        }
    });
}

function selectLabelColor(color) {
    selectedLabelColor = color;
    updateColorSelection();
}

function updateColorSelection() {
    const colorOptions = document.querySelectorAll('.color-option');
    colorOptions.forEach(option => {
        option.style.border = option.dataset.color === selectedLabelColor ? '2px solid #87A96B' : '2px solid white';
    });
}

function handleAddLabel(event) {
    event.preventDefault();
    
    const formData = new FormData(event.target);
    const labelName = formData.get('name').trim();
    
    if (!labelName) {
        showNotification('Please enter a label name', 'error');
        return;
    }
    
    // Check if label already exists
    if (labels.some(label => label.name.toLowerCase() === labelName.toLowerCase())) {
        showNotification('Label already exists', 'error');
        return;
    }
    
    const newLabel = {
        id: Date.now().toString(),
        name: labelName,
        color: selectedLabelColor,
        usage: 0
    };
    
    labels.push(newLabel);
    renderLabels();
    closeAddLabelModal();
    
    showNotification('Label added successfully!', 'success');
}

function deleteLabel(labelId) {
    const label = labels.find(l => l.id === labelId);
    if (!label) return;
    
    if (label.usage > 0) {
        showNotification('Cannot delete label that is in use', 'error');
        return;
    }
    
    if (confirm('Are you sure you want to delete this label?')) {
        labels = labels.filter(l => l.id !== labelId);
        renderLabels();
        showNotification('Label deleted successfully!', 'success');
    }
}

function exportData(type) {
    let data = {};
    let filename = '';
    
    switch (type) {
        case 'all':
            data = {
                mementos: JSON.parse(localStorage.getItem('mementos') || '[]'),
                settings: userSettings,
                labels: labels,
                exportDate: new Date().toISOString(),
                version: '1.0'
            };
            filename = `memento-complete-backup-${new Date().toISOString().split('T')[0]}.json`;
            break;
        case 'mementos':
            data = {
                mementos: JSON.parse(localStorage.getItem('mementos') || '[]'),
                exportDate: new Date().toISOString(),
                version: '1.0'
            };
            filename = `memento-data-${new Date().toISOString().split('T')[0]}.json`;
            break;
        case 'settings':
            data = {
                settings: userSettings,
                labels: labels,
                exportDate: new Date().toISOString(),
                version: '1.0'
            };
            filename = `memento-settings-${new Date().toISOString().split('T')[0]}.json`;
            break;
    }
    
    const blob = new Blob([JSON.stringify(data, null, 2)], { type: 'application/json' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = filename;
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(url);
    
    showNotification(`Data exported successfully!`, 'success');
}

function handleImportFile(event) {
    const file = event.target.files[0];
    if (file) {
        importDataFromFile(file);
    }
}

function handleDragOver(event) {
    event.preventDefault();
    event.currentTarget.classList.add('dragover');
}

function handleDragLeave(event) {
    event.currentTarget.classList.remove('dragover');
}

function handleDrop(event) {
    event.preventDefault();
    event.currentTarget.classList.remove('dragover');
    
    const files = event.dataTransfer.files;
    if (files.length > 0) {
        importDataFromFile(files[0]);
    }
}

function importDataFromFile(file) {
    const reader = new FileReader();
    reader.onload = function(e) {
        try {
            const data = JSON.parse(e.target.result);
            
            if (data.mementos && Array.isArray(data.mementos)) {
                localStorage.setItem('mementos', JSON.stringify(data.mementos));
            }
            
            if (data.settings) {
                userSettings = { ...userSettings, ...data.settings };
                localStorage.setItem('userSettings', JSON.stringify(userSettings));
                loadSettings(); // Reload UI
            }
            
            if (data.labels && Array.isArray(data.labels)) {
                labels = data.labels;
                renderLabels();
            }
            
            showNotification('Data imported successfully!', 'success');
        } catch (error) {
            showNotification('Error reading file. Please check the file format.', 'error');
        }
    };
    reader.readAsText(file);
}

function confirmClearData() {
    if (confirm('Are you sure you want to clear all data? This action cannot be undone.')) {
        localStorage.clear();
        showNotification('All data cleared successfully!', 'success');
        
        // Reload page after a delay
        setTimeout(() => {
            window.location.reload();
        }, 2000);
    }
}

function confirmResetSettings() {
    if (confirm('Are you sure you want to reset all settings to default? This action cannot be undone.')) {
        localStorage.removeItem('userSettings');
        showNotification('Settings reset successfully!', 'success');
        
        // Reload page after a delay
        setTimeout(() => {
            window.location.reload();
        }, 2000);
    }
}

function showNotification(message, type = 'info') {
    const notification = document.createElement('div');
    notification.className = `fixed top-20 right-4 z-50 px-6 py-3 rounded-lg shadow-lg text-white ${
        type === 'success' ? 'bg-green-500' : 
        type === 'error' ? 'bg-red-500' : 'bg-blue-500'
    }`;
    notification.textContent = message;
    
    document.body.appendChild(notification);
    
    anime({
        targets: notification,
        translateX: [300, 0],
        opacity: [0, 1],
        duration: 300,
        easing: 'easeOutQuart'
    });
    
    setTimeout(() => {
        anime({
            targets: notification,
            translateX: [0, 300],
            opacity: [1, 0],
            duration: 300,
            easing: 'easeInQuart',
            complete: () => {
                document.body.removeChild(notification);
            }
        });
    }, 3000);
}

function animateElements() {
    // Animate setting cards
    anime({
        targets: '.setting-card',
        opacity: [0, 1],
        translateY: [30, 0],
        delay: anime.stagger(150, {start: 100}),
        duration: 800,
        easing: 'easeOutQuart'
    });
}