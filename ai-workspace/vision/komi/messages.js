// Messages Page JavaScript

let mementos = [];
let messages = [];
let messageStatsChart = null;

// Message templates
const messageTemplates = [
    {
        id: 'template1',
        name: 'Follow-up Meeting',
        content: 'Hi {name}, it was great meeting you at {event}. I\'d love to continue our conversation about {topic}. Would you be available for a quick call this week?',
        category: 'networking'
    },
    {
        id: 'template2',
        name: 'Birthday Wishes',
        content: 'Happy Birthday, {name}! Wishing you a wonderful day filled with joy and celebration. Hope this year brings you lots of happiness and success.',
        category: 'personal'
    },
    {
        id: 'template3',
        name: 'Thank You Note',
        content: 'Hi {name}, I wanted to thank you for {reason}. Your help and support meant a lot to me. Looking forward to staying in touch!',
        category: 'professional'
    },
    {
        id: 'template4',
        name: 'Catch Up',
        content: 'Hi {name}, it\'s been a while since we last connected. How have you been? Would love to catch up and hear what you\'ve been up to.',
        category: 'personal'
    },
    {
        id: 'template5',
        name: 'Job Opportunity',
        content: 'Hi {name}, I came across an opportunity that might interest you. It\'s a {position} role at {company}. Let me know if you\'d like me to share more details.',
        category: 'professional'
    }
];

// Mock messages data
const mockMessagesData = [
    {
        id: 'msg1',
        recipientId: '1',
        recipientName: 'Sarah Chen',
        type: 'email',
        subject: 'Following up on our conversation',
        content: 'Hi Sarah, it was great meeting you at the TechSummit. I\'d love to continue our conversation about AI ethics. Would you be available for a quick call this week?',
        scheduledFor: '2024-01-20T10:00:00Z',
        sentAt: null,
        status: 'scheduled',
        priority: 'normal'
    },
    {
        id: 'msg2',
        recipientId: '2',
        recipientName: 'Michael Rodriguez',
        type: 'sms',
        subject: '',
        content: 'Hey Mike! Happy Birthday! Hope you\'re having an amazing day. Let\'s catch up soon!',
        scheduledFor: '2024-01-15T09:00:00Z',
        sentAt: '2024-01-15T09:00:00Z',
        status: 'sent',
        priority: 'normal'
    },
    {
        id: 'msg3',
        recipientId: '3',
        recipientName: 'Emily Watson',
        type: 'email',
        subject: 'Quarterly Portfolio Review',
        content: 'Hi Emily, I hope this email finds you well. I\'d like to schedule our quarterly portfolio review meeting. Please let me know your availability.',
        scheduledFor: '2024-01-18T14:00:00Z',
        sentAt: null,
        status: 'scheduled',
        priority: 'high'
    },
    {
        id: 'msg4',
        recipientId: '1',
        recipientName: 'Sarah Chen',
        type: 'whatsapp',
        subject: '',
        content: 'Great meeting you at the conference! Here\'s my contact info. Let\'s stay in touch.',
        scheduledFor: '2024-01-12T16:30:00Z',
        sentAt: '2024-01-12T16:30:00Z',
        status: 'sent',
        priority: 'normal'
    }
];

document.addEventListener('DOMContentLoaded', function() {
    loadData();
    setupEventListeners();
    renderMessages();
    renderTemplates();
    renderQuickCompose();
    renderRecentActivity();
    initializeChart();
    animateElements();
});

function loadData() {
    // Load mementos from localStorage
    const storedMementos = localStorage.getItem('mementos');
    if (storedMementos) {
        mementos = JSON.parse(storedMementos);
    } else {
        // Fallback to mock data
        mementos = getMockMementos();
    }
    
    // Initialize messages
    messages = [...mockMessagesData];
}

function getMockMementos() {
    return [
        {
            id: '1',
            name: 'Sarah Chen',
            email: 'sarah.chen@techcorp.com',
            phone: '+1 (555) 123-4567',
            context: 'Met at the TechSummit 2024 conference during the AI panel discussion.',
            jobTitle: 'Senior Product Manager',
            company: 'TechCorp Solutions',
            labels: ['work', 'networking']
        },
        {
            id: '2',
            name: 'Michael Rodriguez',
            email: 'mike.r@designstudio.com',
            phone: '+1 (555) 234-5678',
            context: 'College roommate from UCLA.',
            jobTitle: 'Creative Director',
            company: 'Design Studio Pro',
            labels: ['friends', 'family']
        },
        {
            id: '3',
            name: 'Emily Watson',
            email: 'emily.watson@financeplus.com',
            phone: '+1 (555) 345-6789',
            context: 'Financial advisor who helped with investment portfolio.',
            jobTitle: 'Senior Financial Advisor',
            company: 'FinancePlus LLC',
            labels: ['clients', 'work']
        }
    ];
}

function setupEventListeners() {
    // Compose message modal
    document.getElementById('compose-message-btn').addEventListener('click', openComposeModal);
    document.getElementById('cancel-compose').addEventListener('click', closeComposeModal);
    document.getElementById('compose-form').addEventListener('submit', handleComposeMessage);
    
    // Quick compose form
    document.getElementById('quick-compose-form').addEventListener('submit', handleQuickCompose);
    
    // Close modal on outside click
    document.getElementById('compose-modal').addEventListener('click', function(e) {
        if (e.target === this) closeComposeModal();
    });
}

function renderMessages() {
    const scheduledContainer = document.getElementById('scheduled-messages');
    const sentContainer = document.getElementById('sent-messages');
    
    const scheduledMessages = messages.filter(msg => msg.status === 'scheduled');
    const sentMessages = messages.filter(msg => msg.status === 'sent');
    
    // Update counts
    document.getElementById('scheduled-count').textContent = scheduledMessages.length;
    document.getElementById('sent-count').textContent = sentMessages.length;
    
    // Render scheduled messages
    if (scheduledMessages.length === 0) {
        scheduledContainer.innerHTML = `
            <div class="text-center py-8">
                <div class="text-charcoal opacity-50 mb-4">
                    <svg class="w-12 h-12 mx-auto" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-12a1 1 0 10-2 0v4a1 1 0 00.293.707l2.828 2.829a1 1 0 101.414-1.414L11 9.586V6z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <p class="text-charcoal opacity-70">No scheduled messages</p>
            </div>
        `;
    } else {
        scheduledContainer.innerHTML = scheduledMessages.map(message => createMessageCard(message)).join('');
    }
    
    // Render sent messages
    if (sentMessages.length === 0) {
        sentContainer.innerHTML = `
            <div class="text-center py-8">
                <div class="text-charcoal opacity-50 mb-4">
                    <svg class="w-12 h-12 mx-auto" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                        <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                    </svg>
                </div>
                <p class="text-charcoal opacity-70">No sent messages yet</p>
            </div>
        `;
    } else {
        sentContainer.innerHTML = sentMessages.map(message => createMessageCard(message)).join('');
    }
    
    // Add event listeners to message cards
    addMessageCardListeners();
    
    // Animate messages
    anime({
        targets: '.message-card',
        opacity: [0, 1],
        translateY: [20, 0],
        delay: anime.stagger(100),
        duration: 600,
        easing: 'easeOutQuart'
    });
}

function createMessageCard(message) {
    const statusClass = `status-${message.status}`;
    const typeIcon = getMessageTypeIcon(message.type);
    const priorityColor = getPriorityColor(message.priority);
    
    return `
        <div class="message-card bg-white rounded-lg border border-light p-4">
            <div class="flex justify-between items-start mb-3">
                <div class="flex items-center space-x-3">
                    <div class="p-2 bg-sage bg-opacity-10 rounded-lg text-sage">
                        ${typeIcon}
                    </div>
                    <div>
                        <h3 class="font-medium text-charcoal">${message.recipientName}</h3>
                        <p class="text-sm text-charcoal opacity-70">${message.type.toUpperCase()}</p>
                    </div>
                </div>
                <div class="flex items-center space-x-2">
                    <span class="px-2 py-1 rounded-full text-xs ${statusClass}">${message.status}</span>
                    <span class="px-2 py-1 rounded-full text-xs ${priorityColor}">${message.priority}</span>
                    <button onclick="deleteMessage('${message.id}')" class="text-red-500 hover:text-opacity-80">
                        <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M9 2a1 1 0 000 2h2a1 1 0 100-2H9z" clip-rule="evenodd"/>
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414L7.586 12l-1.293 1.293a1 1 0 101.414 1.414L9 13.414l1.293 1.293a1 1 0 001.414-1.414L10.414 12l1.293-1.293z" clip-rule="evenodd"/>
                        </svg>
                    </button>
                </div>
            </div>
            
            ${message.subject ? `<h4 class="font-medium text-charcoal mb-2">${message.subject}</h4>` : ''}
            <p class="text-charcoal leading-relaxed mb-3">${message.content}</p>
            
            <div class="flex justify-between items-center text-sm text-charcoal opacity-70">
                <span>Scheduled: ${formatDate(message.scheduledFor)}</span>
                ${message.sentAt ? `<span>Sent: ${formatDate(message.sentAt)}</span>` : ''}
            </div>
            
            ${message.status === 'scheduled' ? `
                <div class="mt-3 flex space-x-2">
                    <button onclick="editMessage('${message.id}')" class="text-sage hover:text-opacity-80 text-sm font-medium">Edit</button>
                    <button onclick="sendNow('${message.id}')" class="text-green-600 hover:text-opacity-80 text-sm font-medium">Send Now</button>
                </div>
            ` : ''}
        </div>
    `;
}

function getMessageTypeIcon(type) {
    const icons = {
        email: '<svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"><path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/><path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/></svg>',
        sms: '<svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M18 10c0 3.866-3.582 7-8 7a8.841 8.841 0 01-4.083-.98L2 17l1.338-3.123C2.493 12.767 2 11.434 2 10c0-3.866 3.582-7 8-7s8 3.134 8 7zM7 9H5v2h2V9zm8 0h-2v2h2V9zM9 9h2v2H9V9z" clip-rule="evenodd"/></svg>',
        whatsapp: '<svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M18 10c0 3.866-3.582 7-8 7a8.841 8.841 0 01-4.083-.98L2 17l1.338-3.123C2.493 12.767 2 11.434 2 10c0-3.866 3.582-7 8-7s8 3.134 8 7zM7 9H5v2h2V9zm8 0h-2v2h2V9zM9 9h2v2H9V9z" clip-rule="evenodd"/></svg>'
    };
    return icons[type] || icons.email;
}

function getPriorityColor(priority) {
    const colors = {
        high: 'bg-red-100 text-red-800',
        normal: 'bg-blue-100 text-blue-800',
        low: 'bg-gray-100 text-gray-800'
    };
    return colors[priority] || colors.normal;
}

function addMessageCardListeners() {
    // Add any additional event listeners for message cards
    const messageCards = document.querySelectorAll('.message-card');
    messageCards.forEach(card => {
        card.addEventListener('mouseenter', function() {
            anime({
                targets: this,
                scale: 1.02,
                duration: 200,
                easing: 'easeOutQuart'
            });
        });
        
        card.addEventListener('mouseleave', function() {
            anime({
                targets: this,
                scale: 1,
                duration: 200,
                easing: 'easeOutQuart'
            });
        });
    });
}

function renderTemplates() {
    const templatesContainer = document.getElementById('message-templates');
    
    templatesContainer.innerHTML = messageTemplates.map(template => `
        <div class="template-card border border-light rounded-lg p-3" onclick="useTemplate('${template.id}')">
            <h4 class="font-medium text-charcoal mb-1">${template.name}</h4>
            <p class="text-sm text-charcoal opacity-70 line-clamp-2">${template.content}</p>
            <span class="inline-block mt-2 px-2 py-1 bg-sage bg-opacity-10 text-sage text-xs rounded-full">${template.category}</span>
        </div>
    `).join('');
}

function renderQuickCompose() {
    const recipientSelect = document.getElementById('quick-recipient');
    const composeRecipientSelect = document.querySelector('select[name="recipient"]');
    
    const options = mementos.map(memento => 
        `<option value="${memento.id}">${memento.name}</option>`
    ).join('');
    
    recipientSelect.innerHTML = '<option value="">Select a memento...</option>' + options;
    if (composeRecipientSelect) {
        composeRecipientSelect.innerHTML = '<option value="">Select a memento...</option>' + options;
    }
}

function renderRecentActivity() {
    const activityContainer = document.getElementById('recent-activity');
    const recentMessages = messages
        .sort((a, b) => new Date(b.scheduledFor) - new Date(a.scheduledFor))
        .slice(0, 5);
    
    if (recentMessages.length === 0) {
        activityContainer.innerHTML = '<p class="text-charcoal opacity-70 text-sm">No recent activity</p>';
        return;
    }
    
    activityContainer.innerHTML = recentMessages.map(message => `
        <div class="flex items-start space-x-3">
            <div class="w-2 h-2 bg-sage rounded-full mt-2"></div>
            <div>
                <p class="text-sm text-charcoal">
                    ${message.status === 'sent' ? 'Sent' : 'Scheduled'} ${message.type} to ${message.recipientName}
                </p>
                <p class="text-xs text-charcoal opacity-70">${formatDate(message.scheduledFor)}</p>
            </div>
        </div>
    `).join('');
}

function initializeChart() {
    const chartContainer = document.getElementById('messages-chart');
    messageStatsChart = echarts.init(chartContainer);
    
    // Prepare data
    const messageTypes = ['email', 'sms', 'whatsapp'];
    const statusTypes = ['sent', 'scheduled'];
    
    const sentData = messageTypes.map(type => 
        messages.filter(msg => msg.type === type && msg.status === 'sent').length
    );
    
    const scheduledData = messageTypes.map(type => 
        messages.filter(msg => msg.type === type && msg.status === 'scheduled').length
    );
    
    const option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        legend: {
            data: ['Sent', 'Scheduled'],
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
            data: messageTypes.map(type => type.toUpperCase()),
            axisLabel: {
                color: '#2C2C2C'
            }
        },
        yAxis: {
            type: 'value',
            axisLabel: {
                color: '#2C2C2C'
            }
        },
        series: [
            {
                name: 'Sent',
                type: 'bar',
                data: sentData,
                itemStyle: {
                    color: '#87A96B'
                }
            },
            {
                name: 'Scheduled',
                type: 'bar',
                data: scheduledData,
                itemStyle: {
                    color: '#D4AF37'
                }
            }
        ]
    };
    
    messageStatsChart.setOption(option);
    
    // Make chart responsive
    window.addEventListener('resize', function() {
        messageStatsChart.resize();
    });
}

function openComposeModal() {
    const modal = document.getElementById('compose-modal');
    modal.classList.remove('hidden');
    
    anime({
        targets: modal.querySelector('.bg-white'),
        scale: [0.8, 1],
        opacity: [0, 1],
        duration: 300,
        easing: 'easeOutQuart'
    });
}

function closeComposeModal() {
    const modal = document.getElementById('compose-modal');
    
    anime({
        targets: modal.querySelector('.bg-white'),
        scale: [1, 0.8],
        opacity: [1, 0],
        duration: 200,
        easing: 'easeInQuart',
        complete: () => {
            modal.classList.add('hidden');
            document.getElementById('compose-form').reset();
        }
    });
}

function handleComposeMessage(event) {
    event.preventDefault();
    
    const formData = new FormData(event.target);
    const recipientId = formData.get('recipient');
    const recipient = mementos.find(m => m.id === recipientId);
    
    if (!recipient) {
        showNotification('Please select a valid recipient', 'error');
        return;
    }
    
    const newMessage = {
        id: Date.now().toString(),
        recipientId: recipientId,
        recipientName: recipient.name,
        type: formData.get('type'),
        subject: formData.get('subject') || '',
        content: formData.get('content'),
        scheduledFor: formData.get('scheduledFor') || new Date().toISOString(),
        sentAt: formData.get('scheduledFor') ? null : new Date().toISOString(),
        status: formData.get('scheduledFor') ? 'scheduled' : 'sent',
        priority: formData.get('priority')
    };
    
    messages.push(newMessage);
    
    closeComposeModal();
    renderMessages();
    renderRecentActivity();
    updateChart();
    
    const action = newMessage.status === 'scheduled' ? 'scheduled' : 'sent';
    showNotification(`Message ${action} successfully!`, 'success');
}

function handleQuickCompose(event) {
    event.preventDefault();
    
    const recipientId = document.getElementById('quick-recipient').value;
    const messageType = document.getElementById('quick-message-type').value;
    const messageContent = document.getElementById('quick-message').value;
    
    if (!recipientId || !messageContent.trim()) {
        showNotification('Please fill in all required fields', 'error');
        return;
    }
    
    const recipient = mementos.find(m => m.id === recipientId);
    
    const newMessage = {
        id: Date.now().toString(),
        recipientId: recipientId,
        recipientName: recipient.name,
        type: messageType,
        subject: '',
        content: messageContent.trim(),
        scheduledFor: new Date().toISOString(),
        sentAt: new Date().toISOString(),
        status: 'sent',
        priority: 'normal'
    };
    
    messages.push(newMessage);
    
    // Clear form
    document.getElementById('quick-compose-form').reset();
    
    renderMessages();
    renderRecentActivity();
    updateChart();
    
    showNotification('Message sent successfully!', 'success');
}

function useTemplate(templateId) {
    const template = messageTemplates.find(t => t.id === templateId);
    if (!template) return;
    
    // Open compose modal and pre-fill with template
    openComposeModal();
    
    setTimeout(() => {
        const contentField = document.querySelector('textarea[name="content"]');
        if (contentField) {
            contentField.value = template.content;
        }
    }, 100);
}

function editMessage(messageId) {
    const message = messages.find(m => m.id === messageId);
    if (!message) return;
    
    // Open compose modal with message data
    openComposeModal();
    
    setTimeout(() => {
        const form = document.getElementById('compose-form');
        form.querySelector('select[name="recipient"]').value = message.recipientId;
        form.querySelector('select[name="type"]').value = message.type;
        form.querySelector('input[name="subject"]').value = message.subject;
        form.querySelector('textarea[name="content"]').value = message.content;
        form.querySelector('input[name="scheduledFor"]').value = message.scheduledFor ? 
            message.scheduledFor.substring(0, 16) : '';
        form.querySelector('select[name="priority"]').value = message.priority;
        
        // Remove the original message
        const index = messages.findIndex(m => m.id === messageId);
        if (index !== -1) {
            messages.splice(index, 1);
        }
    }, 100);
}

function deleteMessage(messageId) {
    if (confirm('Are you sure you want to delete this message?')) {
        const index = messages.findIndex(m => m.id === messageId);
        if (index !== -1) {
            messages.splice(index, 1);
            renderMessages();
            renderRecentActivity();
            updateChart();
            showNotification('Message deleted successfully!', 'success');
        }
    }
}

function sendNow(messageId) {
    const message = messages.find(m => m.id === messageId);
    if (!message) return;
    
    message.status = 'sent';
    message.sentAt = new Date().toISOString();
    message.scheduledFor = message.sentAt;
    
    renderMessages();
    renderRecentActivity();
    updateChart();
    
    showNotification('Message sent successfully!', 'success');
}

function updateChart() {
    if (!messageStatsChart) return;
    
    const messageTypes = ['email', 'sms', 'whatsapp'];
    
    const sentData = messageTypes.map(type => 
        messages.filter(msg => msg.type === type && msg.status === 'sent').length
    );
    
    const scheduledData = messageTypes.map(type => 
        messages.filter(msg => msg.type === type && msg.status === 'scheduled').length
    );
    
    messageStatsChart.setOption({
        series: [
            {
                name: 'Sent',
                data: sentData
            },
            {
                name: 'Scheduled',
                data: scheduledData
            }
        ]
    });
}

function formatDate(dateString) {
    if (!dateString) return 'Not scheduled';
    
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
    // Animate header
    anime({
        targets: 'header',
        opacity: [0, 1],
        translateY: [-20, 0],
        duration: 600,
        easing: 'easeOutQuart'
    });
    
    // Animate main content sections
    anime({
        targets: '.lg\\:col-span-2 > div, .space-y-6 > div',
        opacity: [0, 1],
        translateY: [30, 0],
        delay: anime.stagger(150, {start: 200}),
        duration: 800,
        easing: 'easeOutQuart'
    });
}