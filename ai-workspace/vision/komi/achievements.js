// Achievements Page JavaScript

let userStats = {
    totalMementos: 24,
    totalNotes: 156,
    totalMessages: 42,
    currentStreak: 7,
    totalPoints: 1250,
    level: 5,
    achievementsUnlocked: 8,
    lastActivity: new Date().toISOString()
};

let achievements = [
    {
        id: 'first-connection',
        name: 'First Connection',
        description: 'Add your first memento',
        icon: '🔗',
        category: 'connections',
        points: 50,
        unlocked: true,
        unlockedDate: '2024-01-10T10:00:00Z',
        progress: 100,
        requirement: 1,
        current: 1
    },
    {
        id: 'network-builder',
        name: 'Network Builder',
        description: 'Add 10 mementos',
        icon: '🌐',
        category: 'connections',
        points: 100,
        unlocked: true,
        unlockedDate: '2024-01-15T14:30:00Z',
        progress: 100,
        requirement: 10,
        current: 10
    },
    {
        id: 'connection-master',
        name: 'Connection Master',
        description: 'Add 25 mementos',
        icon: '👥',
        category: 'connections',
        points: 200,
        unlocked: false,
        progress: 96,
        requirement: 25,
        current: 24
    },
    {
        id: 'social-butterfly',
        name: 'Social Butterfly',
        description: 'Add 50 mementos',
        icon: '🦋',
        category: 'connections',
        points: 300,
        unlocked: false,
        progress: 48,
        requirement: 50,
        current: 24
    },
    {
        id: 'note-taker',
        name: 'Note Taker',
        description: 'Add your first note',
        icon: '📝',
        category: 'engagement',
        points: 50,
        unlocked: true,
        unlockedDate: '2024-01-12T11:20:00Z',
        progress: 100,
        requirement: 1,
        current: 1
    },
    {
        id: 'memory-keeper',
        name: 'Memory Keeper',
        description: 'Add 50 notes',
        icon: '📚',
        category: 'engagement',
        points: 150,
        unlocked: true,
        unlockedDate: '2024-01-20T16:45:00Z',
        progress: 100,
        requirement: 50,
        current: 50
    },
    {
        id: 'communication-expert',
        name: 'Communication Expert',
        description: 'Send 25 messages',
        icon: '📧',
        category: 'engagement',
        points: 150,
        unlocked: true,
        unlockedDate: '2024-01-18T09:15:00Z',
        progress: 100,
        requirement: 25,
        current: 25
    },
    {
        id: 'consistent-connector',
        name: 'Consistent Connector',
        description: 'Maintain a 7-day streak',
        icon: '🔥',
        category: 'engagement',
        points: 200,
        unlocked: true,
        unlockedDate: '2024-01-22T08:00:00Z',
        progress: 100,
        requirement: 7,
        current: 7
    },
    {
        id: 'relationship-architect',
        name: 'Relationship Architect',
        description: 'Add notes to 20 different mementos',
        icon: '🏗️',
        category: 'engagement',
        points: 250,
        unlocked: false,
        progress: 85,
        requirement: 20,
        current: 17
    },
    {
        id: 'master-networker',
        name: 'Master Networker',
        description: 'Reach 1000 total points',
        icon: '⭐',
        category: 'connections',
        points: 500,
        unlocked: true,
        unlockedDate: '2024-01-25T20:30:00Z',
        progress: 100,
        requirement: 1000,
        current: 1250
    }
];

let dailyQuests = [
    {
        id: 'quest1',
        name: 'Daily Connector',
        description: 'Add one new note today',
        points: 25,
        completed: false,
        progress: 0,
        requirement: 1
    },
    {
        id: 'quest2',
        name: 'Network Maintainer',
        description: 'Review 3 memento profiles',
        points: 30,
        completed: false,
        progress: 1,
        requirement: 3
    },
    {
        id: 'quest3',
        name: 'Message Scheduler',
        description: 'Schedule a message for tomorrow',
        points: 40,
        completed: false,
        progress: 0,
        requirement: 1
    }
];

let weeklyChallenges = [
    {
        id: 'challenge1',
        name: 'Weekly Goal Crusher',
        description: 'Add 5 new mementos this week',
        points: 100,
        completed: false,
        progress: 2,
        requirement: 5
    },
    {
        id: 'challenge2',
        name: 'Communication Master',
        description: 'Send 10 messages this week',
        points: 150,
        completed: false,
        progress: 4,
        requirement: 10
    }
];

let leaderboard = [
    { name: 'You', points: 1250, level: 5, isUser: true },
    { name: 'Alex Chen', points: 1180, level: 5, isUser: false },
    { name: 'Sarah Kim', points: 950, level: 4, isUser: false },
    { name: 'Mike Johnson', points: 820, level: 4, isUser: false },
    { name: 'Emma Davis', points: 650, level: 3, isUser: false }
];

let currentFilter = 'all';
let progressChart = null;

document.addEventListener('DOMContentLoaded', function() {
    loadUserStats();
    setupEventListeners();
    renderAchievements();
    renderDailyQuests();
    renderWeeklyChallenges();
    renderLeaderboard();
    initializeProgressChart();
    animateElements();
});

function loadUserStats() {
    // Load from localStorage or use defaults
    const storedStats = localStorage.getItem('userStats');
    if (storedStats) {
        userStats = { ...userStats, ...JSON.parse(storedStats) };
    }
    
    // Update UI with current stats
    document.getElementById('total-achievements').textContent = userStats.achievementsUnlocked;
    document.getElementById('total-points').textContent = userStats.totalPoints;
    document.getElementById('current-streak').textContent = userStats.currentStreak;
    document.getElementById('rank-level').textContent = `Level ${userStats.level}`;
}

function setupEventListeners() {
    // Category filters
    const categoryFilters = document.querySelectorAll('.category-filter');
    categoryFilters.forEach(filter => {
        filter.addEventListener('click', function() {
            const category = this.dataset.category;
            setActiveFilter(category);
        });
    });
    
    // Achievement modal
    document.getElementById('close-achievement-modal').addEventListener('click', closeAchievementModal);
    document.getElementById('achievement-modal').addEventListener('click', function(e) {
        if (e.target === this) closeAchievementModal();
    });
}

function setActiveFilter(category) {
    currentFilter = category;
    
    // Update filter buttons
    const categoryFilters = document.querySelectorAll('.category-filter');
    categoryFilters.forEach(filter => {
        if (filter.dataset.category === category) {
            filter.className = 'category-filter bg-sage text-white px-4 py-2 rounded-lg';
        } else {
            filter.className = 'category-filter border border-light text-charcoal px-4 py-2 rounded-lg hover:bg-light';
        }
    });
    
    renderAchievements();
}

function renderAchievements() {
    const container = document.getElementById('achievements-grid');
    let filteredAchievements = achievements;
    
    if (currentFilter !== 'all') {
        filteredAchievements = achievements.filter(a => a.category === currentFilter);
    }
    
    container.innerHTML = filteredAchievements.map(achievement => {
        const isUnlocked = achievement.unlocked;
        const cardClass = isUnlocked ? 'achievement-unlocked achievement-glow' : 'achievement-locked';
        const iconClass = isUnlocked ? 'text-4xl' : 'text-4xl grayscale';
        
        return `
            <div class="achievement-card ${cardClass} rounded-lg border border-light p-6 cursor-pointer" 
                 onclick="showAchievementDetail('${achievement.id}')">
                <div class="text-center">
                    <div class="${iconClass} mb-3">${achievement.icon}</div>
                    <h3 class="font-display text-lg font-semibold text-charcoal mb-2">${achievement.name}</h3>
                    <p class="text-sm text-charcoal opacity-70 mb-4">${achievement.description}</p>
                    
                    ${!isUnlocked ? `
                        <div class="mb-3">
                            <div class="w-full bg-light rounded-full h-2">
                                <div class="bg-sage h-2 rounded-full transition-all duration-500" 
                                     style="width: ${achievement.progress}%"></div>
                            </div>
                            <p class="text-xs text-charcoal opacity-70 mt-1">
                                ${achievement.current}/${achievement.requirement}
                            </p>
                        </div>
                    ` : `
                        <div class="mb-3">
                            <span class="inline-block px-3 py-1 bg-gold text-white text-xs rounded-full">
                                Unlocked ${formatDate(achievement.unlockedDate)}
                            </span>
                        </div>
                    `}
                    
                    <div class="text-gold font-semibold">+${achievement.points} points</div>
                </div>
            </div>
        `;
    }).join('');
    
    // Animate achievement cards
    anime({
        targets: '.achievement-card',
        opacity: [0, 1],
        scale: [0.9, 1],
        delay: anime.stagger(100),
        duration: 600,
        easing: 'easeOutQuart'
    });
}

function renderDailyQuests() {
    const container = document.getElementById('daily-quests');
    
    container.innerHTML = dailyQuests.map(quest => {
        const progressPercentage = (quest.progress / quest.requirement) * 100;
        const isCompleted = quest.completed || progressPercentage >= 100;
        
        return `
            <div class="quest-card p-3 rounded-lg border border-light ${isCompleted ? 'bg-green-50 border-green-200' : ''}">
                <div class="flex justify-between items-start mb-2">
                    <h4 class="font-medium text-charcoal">${quest.name}</h4>
                    <span class="text-gold text-sm font-semibold">+${quest.points}</span>
                </div>
                <p class="text-sm text-charcoal opacity-70 mb-3">${quest.description}</p>
                
                <div class="mb-2">
                    <div class="w-full bg-light rounded-full h-1.5">
                        <div class="bg-sage h-1.5 rounded-full transition-all duration-500" 
                             style="width: ${Math.min(progressPercentage, 100)}%"></div>
                    </div>
                    <div class="flex justify-between text-xs text-charcoal opacity-70 mt-1">
                        <span>${quest.progress}/${quest.requirement}</span>
                        <span>${Math.round(progressPercentage)}%</span>
                    </div>
                </div>
                
                ${isCompleted ? `
                    <div class="text-center">
                        <span class="inline-block px-2 py-1 bg-green-500 text-white text-xs rounded-full">
                            ✓ Completed
                        </span>
                    </div>
                ` : `
                    <button onclick="completeQuest('${quest.id}')" 
                            class="w-full bg-sage text-white py-1.5 rounded text-sm hover:bg-opacity-90 transition-colors">
                        Complete Quest
                    </button>
                `}
            </div>
        `;
    }).join('');
}

function renderWeeklyChallenges() {
    const container = document.getElementById('weekly-challenges');
    
    container.innerHTML = weeklyChallenges.map(challenge => {
        const progressPercentage = (challenge.progress / challenge.requirement) * 100;
        const isCompleted = challenge.completed || progressPercentage >= 100;
        
        return `
            <div class="bg-white rounded-lg border border-light p-4">
                <div class="flex justify-between items-start mb-3">
                    <h4 class="font-medium text-charcoal">${challenge.name}</h4>
                    <span class="text-gold text-sm font-semibold">+${challenge.points}</span>
                </div>
                <p class="text-sm text-charcoal opacity-70 mb-3">${challenge.description}</p>
                
                <div class="mb-3">
                    <div class="w-full bg-light rounded-full h-2">
                        <div class="bg-sage h-2 rounded-full transition-all duration-500" 
                             style="width: ${Math.min(progressPercentage, 100)}%"></div>
                    </div>
                    <div class="flex justify-between text-xs text-charcoal opacity-70 mt-1">
                        <span>${challenge.progress}/${challenge.requirement}</span>
                        <span>${Math.round(progressPercentage)}%</span>
                    </div>
                </div>
                
                ${isCompleted ? `
                    <div class="text-center">
                        <span class="inline-block px-3 py-1 bg-green-500 text-white text-sm rounded-full">
                            ✓ Completed
                        </span>
                    </div>
                ` : `
                    <div class="text-center">
                        <span class="inline-block px-3 py-1 bg-yellow-500 text-white text-sm rounded-full">
                            In Progress
                        </span>
                    </div>
                `}
            </div>
        `;
    }).join('');
}

function renderLeaderboard() {
    const container = document.getElementById('leaderboard');
    
    container.innerHTML = leaderboard.map((entry, index) => {
        const rankIcon = getRankIcon(index);
        const isUser = entry.isUser;
        
        return `
            <div class="leaderboard-item flex items-center justify-between p-3 rounded-lg ${isUser ? 'bg-sage bg-opacity-10' : ''}">
                <div class="flex items-center space-x-3">
                    <div class="flex items-center justify-center w-8 h-8 rounded-full ${index < 3 ? 'bg-gold text-white' : 'bg-light text-charcoal'}">
                        ${rankIcon}
                    </div>
                    <div>
                        <h4 class="font-medium text-charcoal ${isUser ? 'text-sage' : ''}">${entry.name}</h4>
                        <p class="text-xs text-charcoal opacity-70">Level ${entry.level}</p>
                    </div>
                </div>
                <div class="text-right">
                    <div class="font-semibold text-charcoal">${entry.points}</div>
                    <div class="text-xs text-charcoal opacity-70">points</div>
                </div>
            </div>
        `;
    }).join('');
}

function getRankIcon(index) {
    const icons = ['🥇', '🥈', '🥉', '4', '5'];
    return icons[index] || (index + 1).toString();
}

function initializeProgressChart() {
    const chartContainer = document.getElementById('progress-chart');
    progressChart = echarts.init(chartContainer);
    
    // Generate sample data for the last 30 days
    const dates = [];
    const points = [];
    const mementos = [];
    
    for (let i = 29; i >= 0; i--) {
        const date = new Date();
        date.setDate(date.getDate() - i);
        dates.push(date.toLocaleDateString('en-US', { month: 'short', day: 'numeric' }));
        
        // Sample data - in real app, this would come from user activity
        points.push(Math.floor(Math.random() * 100) + 20);
        mementos.push(Math.floor(Math.random() * 3) + 1);
    }
    
    const option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross'
            }
        },
        legend: {
            data: ['Points Earned', 'Mementos Added'],
            textStyle: {
                color: '#2C2C2C'
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: {
            type: 'category',
            data: dates,
            axisLabel: {
                color: '#2C2C2C',
                rotate: 45
            }
        },
        yAxis: [
            {
                type: 'value',
                name: 'Points',
                position: 'left',
                axisLabel: {
                    color: '#2C2C2C'
                }
            },
            {
                type: 'value',
                name: 'Mementos',
                position: 'right',
                axisLabel: {
                    color: '#2C2C2C'
                }
            }
        ],
        series: [
            {
                name: 'Points Earned',
                type: 'line',
                data: points,
                itemStyle: {
                    color: '#87A96B'
                },
                areaStyle: {
                    color: 'rgba(135, 169, 107, 0.1)'
                }
            },
            {
                name: 'Mementos Added',
                type: 'bar',
                yAxisIndex: 1,
                data: mementos,
                itemStyle: {
                    color: '#D4AF37'
                }
            }
        ]
    };
    
    progressChart.setOption(option);
    
    // Make chart responsive
    window.addEventListener('resize', function() {
        progressChart.resize();
    });
}

function showAchievementDetail(achievementId) {
    const achievement = achievements.find(a => a.id === achievementId);
    if (!achievement) return;
    
    const modal = document.getElementById('achievement-modal');
    const iconElement = document.getElementById('modal-achievement-icon');
    const titleElement = document.getElementById('modal-achievement-title');
    const descriptionElement = document.getElementById('modal-achievement-description');
    const progressElement = document.getElementById('modal-achievement-progress');
    const progressBar = document.getElementById('modal-progress-bar');
    const progressText = document.getElementById('modal-progress-text');
    
    iconElement.src = `resources/achievement-badge.png`;
    iconElement.alt = achievement.name;
    titleElement.textContent = achievement.name;
    descriptionElement.textContent = achievement.description;
    
    if (achievement.unlocked) {
        progressElement.style.display = 'none';
    } else {
        progressElement.style.display = 'block';
        progressBar.style.width = `${achievement.progress}%`;
        progressText.textContent = `${achievement.current}/${achievement.requirement} (${achievement.progress}%)`;
    }
    
    modal.classList.remove('hidden');
    
    anime({
        targets: modal.querySelector('.bg-white'),
        scale: [0.8, 1],
        opacity: [0, 1],
        duration: 300,
        easing: 'easeOutQuart'
    });
}

function closeAchievementModal() {
    const modal = document.getElementById('achievement-modal');
    
    anime({
        targets: modal.querySelector('.bg-white'),
        scale: [1, 0.8],
        opacity: [1, 0],
        duration: 200,
        easing: 'easeInQuart',
        complete: () => {
            modal.classList.add('hidden');
        }
    });
}

function completeQuest(questId) {
    const quest = dailyQuests.find(q => q.id === questId);
    if (!quest || quest.completed) return;
    
    // Simulate quest completion
    quest.completed = true;
    quest.progress = quest.requirement;
    
    // Update user stats
    userStats.totalPoints += quest.points;
    userStats.achievementsUnlocked += 0; // Keep same, just for demo
    
    // Save to localStorage
    localStorage.setItem('userStats', JSON.stringify(userStats));
    
    // Re-render affected components
    renderDailyQuests();
    loadUserStats();
    
    // Show celebration
    triggerCelebration();
    
    showNotification(`Quest completed! +${quest.points} points`, 'success');
}

function triggerCelebration() {
    const container = document.getElementById('celebration-container');
    
    // Create particle effect
    for (let i = 0; i < 50; i++) {
        createParticle(container);
    }
    
    // Clear particles after animation
    setTimeout(() => {
        container.innerHTML = '';
    }, 3000);
}

function createParticle(container) {
    const particle = document.createElement('div');
    particle.style.position = 'absolute';
    particle.style.width = '10px';
    particle.style.height = '10px';
    particle.style.backgroundColor = ['#87A96B', '#D4AF37', '#4A4A4A'][Math.floor(Math.random() * 3)];
    particle.style.borderRadius = '50%';
    particle.style.left = Math.random() * 100 + '%';
    particle.style.top = '100%';
    particle.style.pointerEvents = 'none';
    
    container.appendChild(particle);
    
    anime({
        targets: particle,
        translateY: -window.innerHeight - 100,
        translateX: (Math.random() - 0.5) * 200,
        rotate: Math.random() * 360,
        scale: [1, 0],
        duration: 3000,
        easing: 'easeOutQuart',
        complete: () => {
            if (particle.parentNode) {
                particle.parentNode.removeChild(particle);
            }
        }
    });
}

function formatDate(dateString) {
    const date = new Date(dateString);
    return date.toLocaleDateString('en-US', { 
        month: 'short', 
        day: 'numeric',
        year: 'numeric'
    });
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
    // Animate stats cards
    anime({
        targets: '.stats-card',
        opacity: [0, 1],
        scale: [0.9, 1],
        delay: anime.stagger(150, {start: 100}),
        duration: 800,
        easing: 'easeOutQuart'
    });
    
    // Animate main sections
    anime({
        targets: '.lg\\:col-span-2 > div, .space-y-6 > div',
        opacity: [0, 1],
        translateY: [30, 0],
        delay: anime.stagger(200, {start: 400}),
        duration: 800,
        easing: 'easeOutQuart'
    });
}