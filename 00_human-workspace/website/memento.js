// Memento Detail Page JavaScript

let currentMemento = null;
let currentTab = 'overview';
let isEditMode = false;

// Mock messages data
const mockMessages = [
    {
        id: 'msg1',
        mementoId: '1',
        type: 'email',
        content: 'Following up on our discussion about the ML project collaboration. Would love to schedule a call to discuss details.',
        scheduledFor: '2024-01-20T10:00:00Z',
        status: 'scheduled',
        sentAt: null
    },
    {
        id: 'msg2',
        mementoId: '1',
        type: 'sms',
        content: 'Great meeting you at the conference! Let\'s stay in touch.',
        scheduledFor: '2024-01-15T14:30:00Z',
        status: 'sent',
        sentAt: '2024-01-15T14:30:00Z'
    }
];

document.addEventListener('DOMContentLoaded', function() {
    loadMementoData();
    setupEventListeners();
    animateElements();
});

function loadMementoData() {
    const urlParams = new URLSearchParams(window.location.search);
    const mementoId = urlParams.get('id') || '1';
    
    // Load from localStorage or use mock data
    const storedMementos = localStorage.getItem('mementos');
    let mementos = [];
    
    if (storedMementos) {
        mementos = JSON.parse(storedMementos);
    } else {
        // Fallback to mock data if no stored data
        mementos = getMockMementos();
    }
    
    currentMemento = mementos.find(m => m.id === mementoId);
    
    if (!currentMemento) {
        // If not found, use first mock memento for demo
        currentMemento = mementos[0];
    }
    
    populateMementoData();
    renderCurrentTab();
}

function getMockMementos() {
    return [
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
                { id: 'n2', content: 'Sent connection request on LinkedIn', date: '2024-01-10', favorite: false },
                { id: 'n3', content: 'Shared interesting article about AI ethics', date: '2024-01-08', favorite: false }
            ],
            photo: 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face',
            createdAt: '2024-01-10T10:00:00Z',
            updatedAt: '2024-01-15T14:30:00Z'
        }
    ];
}

function populateMementoData() {
    if (!currentMemento) return;
    
    // Update breadcrumb
    document.getElementById('memento-name').textContent = currentMemento.name;
    
    // Profile header
    document.getElementById('memento-photo').src = currentMemento.photo;
    document.getElementById('memento-photo').alt = currentMemento.name;
    document.getElementById('memento-name-display').textContent = currentMemento.name;
    document.getElementById('memento-job').textContent = currentMemento.jobTitle;
    document.getElementById('memento-company').textContent = currentMemento.company;
    document.getElementById('memento-context').textContent = currentMemento.context;
    
    // Labels
    const labelsContainer = document.getElementById('memento-labels');
    const labelColors = {
        family: 'bg-blue-100 text-blue-800',
        work: 'bg-green-100 text-green-800',
        friends: 'bg-purple-100 text-purple-800',
        networking: 'bg-yellow-100 text-yellow-800',
        clients: 'bg-red-100 text-red-800'
    };
    
    labelsContainer.innerHTML = currentMemento.labels.map(label => {
        const colorClass = labelColors[label] || 'bg-gray-100 text-gray-800';
        return `<span class="px-3 py-1 rounded-full text-sm ${colorClass}">${label}</span>`;
    }).join('');
    
    // Contact information
    document.getElementById('memento-email').textContent = currentMemento.email || 'Not provided';
    document.getElementById('memento-phone').textContent = currentMemento.phone || 'Not provided';
    document.getElementById('memento-birthday').textContent = formatDate(currentMemento.birthday) || 'Not provided';
    document.getElementById('memento-created').textContent = formatDate(currentMemento.createdAt);
    document.getElementById('memento-updated').textContent = formatDate(currentMemento.updatedAt);
    
    // Quick stats
    document.getElementById('notes-count').textContent = currentMemento.notes.length;
    document.getElementById('messages-count').textContent = getMessageCount();
    document.getElementById('days-since-contact').textContent = calculateDaysSinceContact();
}

function setupEventListeners() {
    // Tab navigation
    const tabButtons = document.querySelectorAll('.tab-button');
    tabButtons.forEach(button => {
        button.addEventListener('click', () => {
            const tabName = button.dataset.tab;
            switchTab(tabName);
        });
    });
    
    // Edit mode toggle
    document.getElementById('edit-memento-btn').addEventListener('click', toggleEditMode);
    
    // Delete memento
    document.getElementById('delete-memento-btn').addEventListener('click', deleteMemento);
    
    // Add note modal
    document.getElementById('add-note-btn').addEventListener('click', openAddNoteModal);
    document.getElementById('cancel-add-note').addEventListener('click', closeAddNoteModal);
    document.getElementById('add-note-form').addEventListener('submit', handleAddNote);
    
    // Schedule message modal
    document.getElementById('schedule-message-btn').addEventListener('click', openScheduleMessageModal);
    document.getElementById('cancel-schedule-message').addEventListener('click', closeScheduleMessageModal);
    document.getElementById('schedule-message-form').addEventListener('submit', handleScheduleMessage);
    
    // Close modals on outside click
    document.getElementById('add-note-modal').addEventListener('click', function(e) {
        if (e.target === this) closeAddNoteModal();
    });
    
    document.getElementById('schedule-message-modal').addEventListener('click', function(e) {
        if (e.target === this) closeScheduleMessageModal();
    });
}

function switchTab(tabName) {
    // Update tab buttons
    const tabButtons = document.querySelectorAll('.tab-button');
    tabButtons.forEach(button => {
        if (button.dataset.tab === tabName) {
            button.classList.add('tab-active');
        } else {
            button.classList.remove('tab-active');
        }
    });
    
    // Update tab content
    const tabContents = document.querySelectorAll('.tab-content');
    tabContents.forEach(content => {
        content.classList.remove('active');
    });
    
    document.getElementById(`${tabName}-tab`).classList.add('active');
    
    currentTab = tabName;
    renderCurrentTab();
}

function renderCurrentTab() {
    switch (currentTab) {
        case 'overview':
            renderOverviewTab();
            break;
        case 'notes':
            renderNotesTab();
            break;
        case 'messages':
            renderMessagesTab();
            break;
        case 'timeline':
            renderTimelineTab();
            break;
    }
}

function renderOverviewTab() {
    // Overview tab is already populated in populateMementoData()
    // This function can be used for any dynamic updates
}

function renderNotesTab() {
    const notesList = document.getElementById('notes-list');
    
    if (!currentMemento.notes || currentMemento.notes.length === 0) {
        notesList.innerHTML = `
            <div class="text-center py-12">
                <div class="text-charcoal opacity-50 mb-4">
                    <svg class="w-16 h-16 mx-auto" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                </div>
                <h3 class="text-lg font-medium text-charcoal mb-2">No notes yet</h3>
                <p class="text-charcoal opacity-70">Add your first note about ${currentMemento.name}</p>
            </div>
        `;
        return;
    }
    
    // Sort notes: favorites first, then by date (newest first)
    const sortedNotes = [...currentMemento.notes].sort((a, b) => {
        if (a.favorite && !b.favorite) return -1;
        if (!a.favorite && b.favorite) return 1;
        return new Date(b.date) - new Date(a.date);
    });
    
    notesList.innerHTML = sortedNotes.map(note => {
        const isFavorite = note.favorite;
        const cardClass = isFavorite ? 'favorite-note' : '';
        const favoriteIcon = isFavorite ? 
            '<svg class="w-4 h-4 text-gold" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/></svg>' :
            '';
        
        return `
            <div class="note-card ${cardClass} bg-white rounded-lg border border-light p-4">
                <div class="flex justify-between items-start mb-2">
                    <div class="flex items-center space-x-2">
                        ${favoriteIcon}
                        <span class="text-sm font-medium text-charcoal">${formatDate(note.date)}</span>
                    </div>
                    <div class="flex space-x-2">
                        <button onclick="editNote('${note.id}')" class="text-sage hover:text-opacity-80">
                            <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"/>
                            </svg>
                        </button>
                        <button onclick="deleteNote('${note.id}')" class="text-red-500 hover:text-opacity-80">
                            <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M9 2a1 1 0 000 2h2a1 1 0 100-2H9z" clip-rule="evenodd"/>
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414L7.586 12l-1.293 1.293a1 1 0 101.414 1.414L9 13.414l1.293 1.293a1 1 0 001.414-1.414L10.414 12l1.293-1.293z" clip-rule="evenodd"/>
                            </svg>
                        </button>
                    </div>
                </div>
                <p class="text-charcoal leading-relaxed">${note.content}</p>
            </div>
        `;
    }).join('');
    
    // Animate notes
    anime({
        targets: '.note-card',
        opacity: [0, 1],
        translateY: [20, 0],
        delay: anime.stagger(100),
        duration: 600,
        easing: 'easeOutQuart'
    });
}

function renderMessagesTab() {
    const messagesList = document.getElementById('messages-list');
    const messages = mockMessages.filter(msg => msg.mementoId === currentMemento.id);
    
    if (messages.length === 0) {
        messagesList.innerHTML = `
            <div class="text-center py-12">
                <div class="text-charcoal opacity-50 mb-4">
                    <svg class="w-16 h-16 mx-auto" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                        <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                    </svg>
                </div>
                <h3 class="text-lg font-medium text-charcoal mb-2">No scheduled messages</h3>
                <p class="text-charcoal opacity-70">Schedule a message to ${currentMemento.name}</p>
            </div>
        `;
        return;
    }
    
    messagesList.innerHTML = messages.map(message => {
        const statusColor = message.status === 'sent' ? 'text-green-600' : 'text-yellow-600';
        const statusBg = message.status === 'sent' ? 'bg-green-100' : 'bg-yellow-100';
        
        return `
            <div class="bg-white rounded-lg border border-light p-4">
                <div class="flex justify-between items-start mb-3">
                    <div class="flex items-center space-x-3">
                        <span class="text-sm font-medium text-charcoal capitalize">${message.type}</span>
                        <span class="px-2 py-1 rounded-full text-xs ${statusBg} ${statusColor}">${message.status}</span>
                    </div>
                    <div class="text-sm text-charcoal opacity-70">
                        ${formatDate(message.scheduledFor)}
                    </div>
                </div>
                <p class="text-charcoal leading-relaxed mb-3">${message.content}</p>
                ${message.status === 'sent' ? 
                    `<div class="text-sm text-charcoal opacity-70">Sent on ${formatDate(message.sentAt)}</div>` :
                    `<div class="flex space-x-2">
                        <button onclick="editMessage('${message.id}')" class="text-sage hover:text-opacity-80 text-sm">Edit</button>
                        <button onclick="deleteMessage('${message.id}')" class="text-red-500 hover:text-opacity-80 text-sm">Delete</button>
                    </div>`
                }
            </div>
        `;
    }).join('');
    
    // Animate messages
    anime({
        targets: '#messages-list > div',
        opacity: [0, 1],
        translateY: [20, 0],
        delay: anime.stagger(100),
        duration: 600,
        easing: 'easeOutQuart'
    });
}

function renderTimelineTab() {
    const timelineContainer = document.getElementById('timeline-container');
    
    // Create timeline events from notes and messages
    const events = [];
    
    // Add note events
    currentMemento.notes.forEach(note => {
        events.push({
            type: 'note',
            date: note.date,
            content: note.content,
            title: 'Note Added'
        });
    });
    
    // Add message events
    mockMessages
        .filter(msg => msg.mementoId === currentMemento.id)
        .forEach(message => {
            events.push({
                type: 'message',
                date: message.scheduledFor,
                content: `Scheduled ${message.type} message: "${message.content.substring(0, 50)}..."`,
                title: 'Message Scheduled'
            });
        });
    
    // Add creation event
    events.push({
        type: 'creation',
        date: currentMemento.createdAt,
        content: `${currentMemento.name} was added to your mementos`,
        title: 'Memento Created'
    });
    
    // Sort events by date (newest first)
    events.sort((a, b) => new Date(b.date) - new Date(a.date));
    
    timelineContainer.innerHTML = events.map((event, index) => {
        const typeColors = {
            note: 'bg-blue-100 text-blue-800',
            message: 'bg-green-100 text-green-800',
            creation: 'bg-purple-100 text-purple-800'
        };
        
        const typeIcons = {
            note: '<svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20"><path d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>',
            message: '<svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20"><path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/><path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/></svg>',
            creation: '<svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"/></svg>'
        };
        
        return `
            <div class="timeline-item pl-6 pb-6 ${index < events.length - 1 ? 'border-l-2 border-light' : ''}">
                <div class="flex items-center space-x-3 mb-2">
                    <div class="p-2 rounded-full ${typeColors[event.type]}">
                        ${typeIcons[event.type]}
                    </div>
                    <div>
                        <h4 class="font-medium text-charcoal">${event.title}</h4>
                        <p class="text-sm text-charcoal opacity-70">${formatDate(event.date)}</p>
                    </div>
                </div>
                <p class="text-charcoal leading-relaxed ml-10">${event.content}</p>
            </div>
        `;
    }).join('');
    
    // Animate timeline
    anime({
        targets: '.timeline-item',
        opacity: [0, 1],
        translateX: [-30, 0],
        delay: anime.stagger(100),
        duration: 600,
        easing: 'easeOutQuart'
    });
}

function toggleEditMode() {
    isEditMode = !isEditMode;
    const editBtn = document.getElementById('edit-memento-btn');
    
    if (isEditMode) {
        editBtn.textContent = 'Save Changes';
        editBtn.className = 'bg-green-500 text-white px-4 py-2 rounded-lg hover:bg-opacity-90 transition-colors';
        makeFieldsEditable();
    } else {
        editBtn.textContent = 'Edit Profile';
        editBtn.className = 'bg-sage text-white px-4 py-2 rounded-lg hover:bg-opacity-90 transition-colors';
        saveChanges();
    }
}

function makeFieldsEditable() {
    // Make context editable
    const contextElement = document.getElementById('memento-context');
    const currentContext = contextElement.textContent;
    contextElement.innerHTML = `<textarea class="edit-input" rows="4">${currentContext}</textarea>`;
    
    // Make other fields editable (email, phone, etc.)
    const emailElement = document.getElementById('memento-email');
    const phoneElement = document.getElementById('memento-phone');
    const birthdayElement = document.getElementById('memento-birthday');
    
    emailElement.innerHTML = `<input type="email" class="edit-input" value="${currentMemento.email || ''}">`;
    phoneElement.innerHTML = `<input type="tel" class="edit-input" value="${currentMemento.phone || ''}">`;
    birthdayElement.innerHTML = `<input type="date" class="edit-input" value="${currentMemento.birthday || ''}">`;
}

function saveChanges() {
    // Save edited values
    const contextTextarea = document.querySelector('#memento-context textarea');
    const emailInput = document.querySelector('#memento-email input');
    const phoneInput = document.querySelector('#memento-phone input');
    const birthdayInput = document.querySelector('#memento-birthday input');
    
    if (contextTextarea) currentMemento.context = contextTextarea.value;
    if (emailInput) currentMemento.email = emailInput.value;
    if (phoneInput) currentMemento.phone = phoneInput.value;
    if (birthdayInput) currentMemento.birthday = birthdayInput.value;
    
    currentMemento.updatedAt = new Date().toISOString();
    
    // Save to localStorage
    const storedMementos = JSON.parse(localStorage.getItem('mementos') || '[]');
    const index = storedMementos.findIndex(m => m.id === currentMemento.id);
    if (index !== -1) {
        storedMementos[index] = currentMemento;
        localStorage.setItem('mementos', JSON.stringify(storedMementos));
    }
    
    // Re-populate data
    populateMementoData();
    
    showNotification('Changes saved successfully!', 'success');
}

function deleteMemento() {
    if (confirm('Are you sure you want to delete this memento? This action cannot be undone.')) {
        const storedMementos = JSON.parse(localStorage.getItem('mementos') || '[]');
        const filteredMementos = storedMementos.filter(m => m.id !== currentMemento.id);
        localStorage.setItem('mementos', JSON.stringify(filteredMementos));
        
        showNotification('Memento deleted successfully!', 'success');
        setTimeout(() => {
            window.location.href = 'index.html';
        }, 1500);
    }
}

function openAddNoteModal() {
    const modal = document.getElementById('add-note-modal');
    modal.classList.remove('hidden');
    
    anime({
        targets: modal.querySelector('.bg-white'),
        scale: [0.8, 1],
        opacity: [0, 1],
        duration: 300,
        easing: 'easeOutQuart'
    });
}

function closeAddNoteModal() {
    const modal = document.getElementById('add-note-modal');
    
    anime({
        targets: modal.querySelector('.bg-white'),
        scale: [1, 0.8],
        opacity: [1, 0],
        duration: 200,
        easing: 'easeInQuart',
        complete: () => {
            modal.classList.add('hidden');
            document.getElementById('add-note-form').reset();
        }
    });
}

function handleAddNote(event) {
    event.preventDefault();
    
    const formData = new FormData(event.target);
    const newNote = {
        id: Date.now().toString(),
        content: formData.get('content'),
        date: new Date().toISOString().split('T')[0],
        favorite: formData.get('favorite') === 'on'
    };
    
    currentMemento.notes.push(newNote);
    currentMemento.updatedAt = new Date().toISOString();
    
    // Save to localStorage
    const storedMementos = JSON.parse(localStorage.getItem('mementos') || '[]');
    const index = storedMementos.findIndex(m => m.id === currentMemento.id);
    if (index !== -1) {
        storedMementos[index] = currentMemento;
        localStorage.setItem('mementos', JSON.stringify(storedMementos));
    }
    
    closeAddNoteModal();
    renderNotesTab();
    populateMementoData(); // Update stats
    
    showNotification('Note added successfully!', 'success');
}

function openScheduleMessageModal() {
    const modal = document.getElementById('schedule-message-modal');
    modal.classList.remove('hidden');
    
    anime({
        targets: modal.querySelector('.bg-white'),
        scale: [0.8, 1],
        opacity: [0, 1],
        duration: 300,
        easing: 'easeOutQuart'
    });
}

function closeScheduleMessageModal() {
    const modal = document.getElementById('schedule-message-modal');
    
    anime({
        targets: modal.querySelector('.bg-white'),
        scale: [1, 0.8],
        opacity: [1, 0],
        duration: 200,
        easing: 'easeInQuart',
        complete: () => {
            modal.classList.add('hidden');
            document.getElementById('schedule-message-form').reset();
        }
    });
}

function handleScheduleMessage(event) {
    event.preventDefault();
    
    const formData = new FormData(event.target);
    const newMessage = {
        id: Date.now().toString(),
        mementoId: currentMemento.id,
        type: formData.get('type'),
        content: formData.get('content'),
        scheduledFor: formData.get('scheduledFor'),
        status: 'scheduled',
        sentAt: null
    };
    
    // Add to mock messages (in real app, this would be saved to database)
    mockMessages.push(newMessage);
    
    closeScheduleMessageModal();
    renderMessagesTab();
    
    showNotification('Message scheduled successfully!', 'success');
}

function editNote(noteId) {
    const note = currentMemento.notes.find(n => n.id === noteId);
    if (!note) return;
    
    const newContent = prompt('Edit note:', note.content);
    if (newContent !== null && newContent.trim() !== '') {
        note.content = newContent.trim();
        currentMemento.updatedAt = new Date().toISOString();
        
        // Save to localStorage
        const storedMementos = JSON.parse(localStorage.getItem('mementos') || '[]');
        const index = storedMementos.findIndex(m => m.id === currentMemento.id);
        if (index !== -1) {
            storedMementos[index] = currentMemento;
            localStorage.setItem('mementos', JSON.stringify(storedMementos));
        }
        
        renderNotesTab();
        showNotification('Note updated successfully!', 'success');
    }
}

function deleteNote(noteId) {
    if (confirm('Are you sure you want to delete this note?')) {
        currentMemento.notes = currentMemento.notes.filter(n => n.id !== noteId);
        currentMemento.updatedAt = new Date().toISOString();
        
        // Save to localStorage
        const storedMementos = JSON.parse(localStorage.getItem('mementos') || '[]');
        const index = storedMementos.findIndex(m => m.id === currentMemento.id);
        if (index !== -1) {
            storedMementos[index] = currentMemento;
            localStorage.setItem('mementos', JSON.stringify(storedMementos));
        }
        
        renderNotesTab();
        populateMementoData(); // Update stats
        showNotification('Note deleted successfully!', 'success');
    }
}

function editMessage(messageId) {
    showNotification('Message editing feature coming soon!', 'info');
}

function deleteMessage(messageId) {
    if (confirm('Are you sure you want to delete this scheduled message?')) {
        const index = mockMessages.findIndex(m => m.id === messageId);
        if (index !== -1) {
            mockMessages.splice(index, 1);
            renderMessagesTab();
            showNotification('Message deleted successfully!', 'success');
        }
    }
}

function getMessageCount() {
    return mockMessages.filter(msg => msg.mementoId === currentMemento.id && msg.status === 'sent').length;
}

function calculateDaysSinceContact() {
    // Calculate days since last note or message
    const dates = [];
    
    if (currentMemento.notes.length > 0) {
        dates.push(new Date(currentMemento.notes[currentMemento.notes.length - 1].date));
    }
    
    const sentMessages = mockMessages.filter(msg => 
        msg.mementoId === currentMemento.id && 
        msg.status === 'sent' && 
        msg.sentAt
    );
    
    if (sentMessages.length > 0) {
        dates.push(new Date(sentMessages[sentMessages.length - 1].sentAt));
    }
    
    if (dates.length === 0) {
        const createdDate = new Date(currentMemento.createdAt);
        const today = new Date();
        return Math.floor((today - createdDate) / (1000 * 60 * 60 * 24));
    }
    
    const latestDate = new Date(Math.max(...dates));
    const today = new Date();
    return Math.floor((today - latestDate) / (1000 * 60 * 60 * 24));
}

function formatDate(dateString) {
    if (!dateString) return 'Not provided';
    
    const date = new Date(dateString);
    const now = new Date();
    const diffTime = Math.abs(now - date);
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
    
    if (diffDays === 1) return 'Yesterday';
    if (diffDays < 7) return `${diffDays} days ago`;
    if (diffDays < 30) return `${Math.ceil(diffDays / 7)} weeks ago`;
    if (diffDays < 365) return `${Math.ceil(diffDays / 30)} months ago`;
    return `${Math.ceil(diffDays / 365)} years ago`;
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
    // Animate profile header
    anime({
        targets: '.bg-white',
        opacity: [0, 1],
        translateY: [30, 0],
        delay: anime.stagger(200, {start: 100}),
        duration: 800,
        easing: 'easeOutQuart'
    });
    
    // Animate tab buttons
    anime({
        targets: '.tab-button',
        opacity: [0, 1],
        translateY: [20, 0],
        delay: anime.stagger(100, {start: 400}),
        duration: 600,
        easing: 'easeOutQuart'
    });
}