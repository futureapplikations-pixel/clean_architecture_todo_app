// Memento App - Main JavaScript File
// Core functionality for relationship management

// Global state management
let mementos = [];
let filteredMementos = [];
let currentView = 'grid';
let searchTerm = '';
let activeLabels = [];

// Mock data for demonstration
const mockMementos = [
    {
        id: '1',
        name: 'Sarah Chen',
        email: 'sarah.chen@techcorp.com',
        phone: '+1 (555) 123-4567',
        context: 'Met at the TechSummit 2024 conference during the AI panel discussion. We connected over our shared interest in machine learning applications.',
        jobTitle: 'Senior Product Manager',
        company: 'TechCorp Solutions',
        birthday: '1990-03-15',
        labels: ['work', 'networking'],
        notes: [
            { id: 'n1', content: 'Follow up about ML project collaboration', date: '2024-01-15', favorite: true },
            { id: 'n2', content: 'Sent connection request on LinkedIn', date: '2024-01-10', favorite: false }
        ],
        photo: 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face',
        createdAt: '2024-01-10T10:00:00Z',
        updatedAt: '2024-01-15T14:30:00Z'
    },
    {
        id: '2',
        name: 'Michael Rodriguez',
        email: 'mike.r@designstudio.com',
        phone: '+1 (555) 234-5678',
        context: 'College roommate from UCLA. We lived together for 2 years and have stayed close friends since graduation.',
        jobTitle: 'Creative Director',
        company: 'Design Studio Pro',
        birthday: '1988-07-22',
        labels: ['friends', 'family'],
        notes: [
            { id: 'n3', content: 'Planning reunion trip to Hawaii', date: '2024-01-12', favorite: true },
            { id: 'n4', content: 'His daughter\'s birthday is coming up next month', date: '2024-01-08', favorite: false }
        ],
        photo: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face',
        createdAt: '2024-01-08T09:00:00Z',
        updatedAt: '2024-01-12T16:45:00Z'
    },
    {
        id: '3',
        name: 'Emily Watson',
        email: 'emily.watson@financeplus.com',
        phone: '+1 (555) 345-6789',
        context: 'Financial advisor who helped with investment portfolio. Very knowledgeable about retirement planning.',
        jobTitle: 'Senior Financial Advisor',
        company: 'FinancePlus LLC',
        birthday: '1985-11-08',
        labels: ['clients', 'work'],
        notes: [
            { id: 'n5', content: 'Quarterly portfolio review scheduled', date: '2024-01-14', favorite: false },
            { id: 'n6', content: 'Discussed Roth IRA conversion strategy', date: '2024-01-05', favorite: true }
        ],
        photo: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face',
        createdAt: '2024-01-05T11:30:00Z',
        updatedAt: '2024-01-14T10:15:00Z'
    },
    {
        id: '4',
        name: 'David Kim',
        email: 'david.kim@startupxyz.com',
        phone: '+1 (555) 456-7890',
        context: 'Co-founder of a promising startup. Met through mutual acquaintance at a networking event.',
        jobTitle: 'CEO & Co-Founder',
        company: 'StartupXYZ',
        birthday: '1992-01-30',
        labels: ['networking', 'work'],
        notes: [
            { id: 'n7', content: 'Potential partnership opportunity', date: '2024-01-11', favorite: true },
            { id: 'n8', content: 'Introduced to their CTO for technical discussion', date: '2024-01-09', favorite: false }
        ],
        photo: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face',
        createdAt: '2024-01-09T14:20:00Z',
        updatedAt: '2024-01-11T09:30:00Z'
    },
    {
        id: '5',
        name: 'Lisa Thompson',
        email: 'lisa.t@healthclinic.com',
        phone: '+1 (555) 567-8901',
        context: 'Family doctor who has been taking care of our family for 5 years. Excellent physician with great bedside manner.',
        jobTitle: 'Primary Care Physician',
        company: 'Community Health Clinic',
        birthday: '1983-05-12',
        labels: ['family'],
        notes: [
            { id: 'n9', content: 'Annual checkup completed', date: '2024-01-13', favorite: false },
            { id: 'n10', content: 'Recommended new vitamin supplement', date: '2024-01-02', favorite: false }
        ],
        photo: 'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=150&h=150&fit=crop&crop=face',
        createdAt: '2024-01-02T08:00:00Z',
        updatedAt: '2024-01-13T15:45:00Z'
    },
    {
        id: '6',
        name: 'James Wilson',
        email: 'james.wilson@lawfirm.com',
        phone: '+1 (555) 678-9012',
        context: 'Corporate lawyer who handled our business incorporation. Very professional and thorough.',
        jobTitle: 'Senior Partner',
        company: 'Wilson & Associates Law',
        birthday: '1979-09-18',
        labels: ['work', 'clients'],
        notes: [
            { id: 'n11', content: 'Contract review completed', date: '2024-01-16', favorite: true },
            { id: 'n12', content: 'Discussed IP protection strategy', date: '2023-12-28', favorite: false }
        ],
        photo: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150&h=150&fit=crop&crop=face',
        createdAt: '2023-12-28T13:00:00Z',
        updatedAt: '2024-01-16T11:20:00Z'
    }
];

// Initialize the application
document.addEventListener('DOMContentLoaded', function() {
    initializeApp();
    setupEventListeners();
    createNetworkBackground();
    animateElements();
});

function initializeApp() {
    // Load mementos from localStorage or use mock data
    const storedMementos = localStorage.getItem('mementos');
    if (storedMementos) {
        mementos = JSON.parse(storedMementos);
    } else {
        mementos = [...mockMementos];
        saveMementos();
    }
    
    filteredMementos = [...mementos];
    renderMementoGrid();
    updateStats();
}

function setupEventListeners() {
    // Search functionality
    const searchInput = document.getElementById('search-input');
    searchInput.addEventListener('input', debounce(handleSearch, 300));
    
    // Label filters
    const labelCheckboxes = document.querySelectorAll('.label-checkbox');
    labelCheckboxes.forEach(checkbox => {
        checkbox.addEventListener('change', handleLabelFilter);
    });
    
    // View toggles
    document.getElementById('grid-view-btn').addEventListener('click', () => setView('grid'));
    document.getElementById('list-view-btn').addEventListener('click', () => setView('list'));
    
    // Modal controls
    document.getElementById('add-memento-btn').addEventListener('click', openAddMementoModal);
    document.getElementById('cancel-add-memento').addEventListener('click', closeAddMementoModal);
    document.getElementById('add-memento-form').addEventListener('submit', handleAddMemento);
    
    // Data management
    document.getElementById('export-data-btn').addEventListener('click', exportData);
    document.getElementById('import-data-btn').addEventListener('click', importData);
    
    // Close modal on outside click
    document.getElementById('add-memento-modal').addEventListener('click', function(e) {
        if (e.target === this) {
            closeAddMementoModal();
        }
    });
}

function handleSearch(event) {
    searchTerm = event.target.value.toLowerCase();
    filterMementos();
}

function handleLabelFilter(event) {
    const label = event.target.dataset.label;
    if (event.target.checked) {
        if (!activeLabels.includes(label)) {
            activeLabels.push(label);
        }
    } else {
        activeLabels = activeLabels.filter(l => l !== label);
    }
    filterMementos();
}

function filterMementos() {
    filteredMementos = mementos.filter(memento => {
        // Search filter
        const matchesSearch = !searchTerm || 
            memento.name.toLowerCase().includes(searchTerm) ||
            memento.context.toLowerCase().includes(searchTerm) ||
            memento.company.toLowerCase().includes(searchTerm) ||
            memento.jobTitle.toLowerCase().includes(searchTerm);
        
        // Label filter
        const matchesLabels = activeLabels.length === 0 || 
            activeLabels.some(label => memento.labels.includes(label));
        
        return matchesSearch && matchesLabels;
    });
    
    renderMementoGrid();
    updateResultsCount();
}

function renderMementoGrid() {
    const grid = document.getElementById('memento-grid');
    
    if (filteredMementos.length === 0) {
        grid.innerHTML = `
            <div class="col-span-full text-center py-12">
                <div class="text-charcoal opacity-50 mb-4">
                    <svg class="w-16 h-16 mx-auto" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <h3 class="text-lg font-medium text-charcoal mb-2">No mementos found</h3>
                <p class="text-charcoal opacity-70">Try adjusting your search or filters</p>
            </div>
        `;
        return;
    }
    
    if (currentView === 'grid') {
        grid.className = 'grid grid-cols-1 md:grid-cols-2 gap-6';
        grid.innerHTML = filteredMementos.map(memento => createMementoCard(memento)).join('');
    } else {
        grid.className = 'space-y-4';
        grid.innerHTML = filteredMementos.map(memento => createMementoListItem(memento)).join('');
    }
    
    // Add click handlers to cards
    const cards = grid.querySelectorAll('.memento-card');
    cards.forEach(card => {
        card.addEventListener('click', () => {
            const mementoId = card.dataset.mementoId;
            window.location.href = `memento.html?id=${mementoId}`;
        });
    });
    
    // Animate cards
    anime({
        targets: '.memento-card',
        opacity: [0, 1],
        translateY: [20, 0],
        delay: anime.stagger(100),
        duration: 600,
        easing: 'easeOutQuart'
    });
}

function createMementoCard(memento) {
    const labelColors = {
        family: 'bg-blue-100 text-blue-800',
        work: 'bg-green-100 text-green-800',
        friends: 'bg-purple-100 text-purple-800',
        networking: 'bg-yellow-100 text-yellow-800',
        clients: 'bg-red-100 text-red-800'
    };
    
    const labelsHtml = memento.labels.map(label => {
        const colorClass = labelColors[label] || 'bg-gray-100 text-gray-800';
        return `<span class="px-2 py-1 rounded-full text-xs ${colorClass}">${label}</span>`;
    }).join('');
    
    return `
        <div class="memento-card card-hover bg-white rounded-lg shadow-sm border border-light p-6 cursor-pointer" data-memento-id="${memento.id}">
            <div class="flex items-start space-x-4 mb-4">
                <img src="${memento.photo}" alt="${memento.name}" class="w-16 h-16 rounded-full object-cover">
                <div class="flex-1">
                    <h3 class="font-display text-lg font-semibold text-charcoal mb-1">${memento.name}</h3>
                    <p class="text-sm text-charcoal opacity-70 mb-2">${memento.jobTitle}</p>
                    <p class="text-sm text-charcoal opacity-70">${memento.company}</p>
                </div>
            </div>
            
            <div class="mb-4">
                <p class="text-sm text-charcoal line-clamp-2">${memento.context}</p>
            </div>
            
            <div class="flex flex-wrap gap-2 mb-4">
                ${labelsHtml}
            </div>
            
            <div class="flex justify-between items-center text-sm text-charcoal opacity-70">
                <span>${memento.notes.length} notes</span>
                <span>Updated ${formatDate(memento.updatedAt)}</span>
            </div>
        </div>
    `;
}

function createMementoListItem(memento) {
    const labelColors = {
        family: 'bg-blue-100 text-blue-800',
        work: 'bg-green-100 text-green-800',
        friends: 'bg-purple-100 text-purple-800',
        networking: 'bg-yellow-100 text-yellow-800',
        clients: 'bg-red-100 text-red-800'
    };
    
    const labelsHtml = memento.labels.map(label => {
        const colorClass = labelColors[label] || 'bg-gray-100 text-gray-800';
        return `<span class="px-2 py-1 rounded-full text-xs ${colorClass}">${label}</span>`;
    }).join('');
    
    return `
        <div class="memento-card card-hover bg-white rounded-lg shadow-sm border border-light p-4 cursor-pointer" data-memento-id="${memento.id}">
            <div class="flex items-center space-x-4">
                <img src="${memento.photo}" alt="${memento.name}" class="w-12 h-12 rounded-full object-cover">
                <div class="flex-1">
                    <h3 class="font-display text-lg font-semibold text-charcoal">${memento.name}</h3>
                    <p class="text-sm text-charcoal opacity-70">${memento.jobTitle} at ${memento.company}</p>
                    <div class="flex flex-wrap gap-1 mt-2">
                        ${labelsHtml}
                    </div>
                </div>
                <div class="text-right text-sm text-charcoal opacity-70">
                    <div>${memento.notes.length} notes</div>
                    <div>${formatDate(memento.updatedAt)}</div>
                </div>
            </div>
        </div>
    `;
}

function setView(view) {
    currentView = view;
    
    // Update button states
    const gridBtn = document.getElementById('grid-view-btn');
    const listBtn = document.getElementById('list-view-btn');
    
    if (view === 'grid') {
        gridBtn.className = 'p-2 bg-sage text-white rounded-lg';
        listBtn.className = 'p-2 border border-light text-charcoal rounded-lg hover:bg-light';
    } else {
        gridBtn.className = 'p-2 border border-light text-charcoal rounded-lg hover:bg-light';
        listBtn.className = 'p-2 bg-sage text-white rounded-lg';
    }
    
    renderMementoGrid();
}

function openAddMementoModal() {
    const modal = document.getElementById('add-memento-modal');
    modal.classList.remove('hidden');
    
    // Animate modal appearance
    anime({
        targets: modal.querySelector('.bg-white'),
        scale: [0.8, 1],
        opacity: [0, 1],
        duration: 300,
        easing: 'easeOutQuart'
    });
}

function closeAddMementoModal() {
    const modal = document.getElementById('add-memento-modal');
    
    anime({
        targets: modal.querySelector('.bg-white'),
        scale: [1, 0.8],
        opacity: [1, 0],
        duration: 200,
        easing: 'easeInQuart',
        complete: () => {
            modal.classList.add('hidden');
            document.getElementById('add-memento-form').reset();
        }
    });
}

function handleAddMemento(event) {
    event.preventDefault();
    
    const formData = new FormData(event.target);
    const selectedLabels = Array.from(formData.getAll('labels'));
    
    const newMemento = {
        id: Date.now().toString(),
        name: formData.get('name'),
        email: formData.get('email'),
        phone: '',
        context: formData.get('context'),
        jobTitle: '',
        company: '',
        birthday: '',
        labels: selectedLabels,
        notes: [],
        photo: `https://images.unsplash.com/photo-${Math.floor(Math.random() * 1000000)}?w=150&h=150&fit=crop&crop=face`,
        createdAt: new Date().toISOString(),
        updatedAt: new Date().toISOString()
    };
    
    mementos.push(newMemento);
    saveMementos();
    filterMementos();
    updateStats();
    closeAddMementoModal();
    
    // Show success notification
    showNotification('Memento added successfully!', 'success');
}

function exportData() {
    const data = {
        mementos: mementos,
        exportDate: new Date().toISOString(),
        version: '1.0'
    };
    
    const blob = new Blob([JSON.stringify(data, null, 2)], { type: 'application/json' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `memento-export-${new Date().toISOString().split('T')[0]}.json`;
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(url);
    
    showNotification('Data exported successfully!', 'success');
}

function importData() {
    const input = document.createElement('input');
    input.type = 'file';
    input.accept = '.json';
    input.onchange = function(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                try {
                    const data = JSON.parse(e.target.result);
                    if (data.mementos && Array.isArray(data.mementos)) {
                        mementos = data.mementos;
                        saveMementos();
                        filterMementos();
                        updateStats();
                        showNotification('Data imported successfully!', 'success');
                    } else {
                        showNotification('Invalid file format', 'error');
                    }
                } catch (error) {
                    showNotification('Error reading file', 'error');
                }
            };
            reader.readAsText(file);
        }
    };
    input.click();
}

function updateStats() {
    const totalMementos = mementos.length;
    const totalNotes = mementos.reduce((sum, memento) => sum + memento.notes.length, 0);
    const totalMessages = 42; // Mock data
    const streakDays = 7; // Mock data
    
    document.querySelector('.stats-card:nth-child(1) .text-2xl').textContent = totalMementos;
    document.querySelector('.stats-card:nth-child(2) .text-2xl').textContent = totalNotes;
    document.querySelector('.stats-card:nth-child(3) .text-2xl').textContent = totalMessages;
    document.querySelector('.stats-card:nth-child(4) .text-2xl').textContent = streakDays;
}

function updateResultsCount() {
    document.getElementById('search-results-count').textContent = filteredMementos.length;
}

function formatDate(dateString) {
    const date = new Date(dateString);
    const now = new Date();
    const diffTime = Math.abs(now - date);
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
    
    if (diffDays === 1) return 'yesterday';
    if (diffDays < 7) return `${diffDays} days ago`;
    if (diffDays < 30) return `${Math.ceil(diffDays / 7)} weeks ago`;
    return `${Math.ceil(diffDays / 30)} months ago`;
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

function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

function saveMementos() {
    localStorage.setItem('mementos', JSON.stringify(mementos));
}

function createNetworkBackground() {
    const sketch = (p) => {
        let nodes = [];
        let connections = [];
        
        p.setup = () => {
            const canvas = p.createCanvas(p.windowWidth, p.windowHeight);
            canvas.parent('network-background');
            
            // Create nodes
            for (let i = 0; i < 50; i++) {
                nodes.push({
                    x: p.random(p.width),
                    y: p.random(p.height),
                    vx: p.random(-0.5, 0.5),
                    vy: p.random(-0.5, 0.5)
                });
            }
        };
        
        p.draw = () => {
            p.clear();
            p.stroke(135, 169, 107, 30);
            p.strokeWeight(1);
            
            // Update and draw nodes
            for (let node of nodes) {
                node.x += node.vx;
                node.y += node.vy;
                
                // Bounce off edges
                if (node.x < 0 || node.x > p.width) node.vx *= -1;
                if (node.y < 0 || node.y > p.height) node.vy *= -1;
                
                // Draw connections
                for (let other of nodes) {
                    let distance = p.dist(node.x, node.y, other.x, other.y);
                    if (distance < 100) {
                        p.line(node.x, node.y, other.x, other.y);
                    }
                }
            }
        };
        
        p.windowResized = () => {
            p.resizeCanvas(p.windowWidth, p.windowHeight);
        };
    };
    
    new p5(sketch);
}

function animateElements() {
    // Animate hero section
    anime({
        targets: '.hero-bg h2',
        opacity: [0, 1],
        translateY: [30, 0],
        duration: 800,
        delay: 200,
        easing: 'easeOutQuart'
    });
    
    anime({
        targets: '.hero-bg p',
        opacity: [0, 1],
        translateY: [20, 0],
        duration: 800,
        delay: 400,
        easing: 'easeOutQuart'
    });
    
    // Animate sidebar elements
    anime({
        targets: '.lg\\:col-span-1 > div',
        opacity: [0, 1],
        translateX: [-30, 0],
        duration: 600,
        delay: 600,
        easing: 'easeOutQuart'
    });
    
    // Animate stats cards
    anime({
        targets: '.stats-card',
        opacity: [0, 1],
        scale: [0.9, 1],
        delay: anime.stagger(100, {start: 800}),
        duration: 600,
        easing: 'easeOutQuart'
    });
}