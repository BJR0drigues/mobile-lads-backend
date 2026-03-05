import { PrismaClient } from '@prisma/client';
import * as crypto from 'crypto';

const prisma = new PrismaClient();

// Helper: hash de senha simples para seed (NÃO usar em produção sem bcrypt)
function hashPassword(password: string): string {
    return crypto.createHash('sha256').update(password).digest('hex');
}

async function main() {
    console.log('🌱 Iniciando seed do banco LADS...\n');

    // ============================================================
    // USERS
    // ============================================================
    console.log('👥 Criando usuários...');

    const adminUser = await prisma.user.upsert({
        where: { email: 'admin@lads.com' },
        update: {},
        create: {
            first_name: 'Admin',
            last_name: 'LADS',
            email: 'admin@lads.com',
            phone: '+55 11 99999-0001',
            password_hash: hashPassword('admin123'),
            email_verified: true,
            email_verified_at: new Date(),
            institution: 'IESGO',
            course: 'Ciência da Computação',
            is_admin: true,
            is_lads_member: true,
            account_status: 'active',
        },
    });

    const professionalUser = await prisma.user.upsert({
        where: { email: 'joao.silva@lads.com' },
        update: {},
        create: {
            first_name: 'João',
            last_name: 'Silva',
            email: 'joao.silva@lads.com',
            phone: '+55 31 98888-0002',
            password_hash: hashPassword('joao123'),
            email_verified: true,
            email_verified_at: new Date(),
            bio: 'Desenvolvedor fullstack apaixonado por tecnologia e inovação.',
            location: 'Formosa, GO',
            date_of_birth: new Date('1995-06-15'),
            gender: 'male',
            institution: 'IESGO',
            course: 'Engenharia de Software',
            graduation_year: 2018,
            is_professional: true,
            is_lads_member: true,
            account_status: 'active',
        },
    });

    const studentUser = await prisma.user.upsert({
        where: { email: 'maria.costa@aluno.ufmg.br' },
        update: {},
        create: {
            first_name: 'Maria',
            last_name: 'Costa',
            email: 'maria.costa@aluno.ufmg.br',
            phone: '+55 31 97777-0003',
            password_hash: hashPassword('maria123'),
            email_verified: true,
            email_verified_at: new Date(),
            bio: 'Estudante de TI interessada em IA e desenvolvimento mobile.',
            location: 'Belo Horizonte, MG',
            date_of_birth: new Date('2002-03-22'),
            gender: 'female',
            institution: 'UFMG',
            course: 'Sistemas de Informação',
            enrollment_number: 'SI2021001',
            graduation_year: 2025,
            is_professional: false,
            is_lads_member: false,
            account_status: 'active',
        },
    });

    console.log(`  ✅ Admin: ${adminUser.email}`);
    console.log(`  ✅ Profissional: ${professionalUser.email}`);
    console.log(`  ✅ Estudante: ${studentUser.email}`);

    // ============================================================
    // PROFESSIONAL PROFILE
    // ============================================================
    console.log('\n💼 Criando perfil profissional...');

    const professional = await prisma.professional.upsert({
        where: { user_id: professionalUser.id },
        update: {},
        create: {
            user_id: professionalUser.id,
            title: 'Engenheiro de Software Sênior',
            company: 'LADS / UFMG',
            position: 'Tech Lead',
            bio_professional: 'Especialista em desenvolvimento web e mobile com mais de 6 anos de experiência.',
            linkedin_url: 'https://linkedin.com/in/joaosilva',
            github_url: 'https://github.com/joaosilva',
            lads_join_date: new Date('2020-03-01'),
            lads_role: 'Tech Lead',
            lads_bio: 'Responsável pelo desenvolvimento das plataformas tecnológicas do LADS.',
            certifications: JSON.stringify(['AWS Certified Developer', 'Google Cloud Professional']),
            achievements: JSON.stringify(['Melhor projeto LADS 2022', 'Palestrante na SemanaCompex 2023']),
            available_for_consulting: true,
            available_for_mentoring: true,
            available_for_speaking: true,
            total_projects: 12,
        },
    });

    console.log(`  ✅ Perfil criado para: ${professionalUser.first_name} ${professionalUser.last_name}`);

    // ============================================================
    // EXPERTISE
    // ============================================================
    console.log('\n🎯 Criando expertise...');

    const expertise1 = await prisma.expertise.upsert({
        where: { id: '00000000-0000-0000-0000-000000000001' },
        update: {},
        create: {
            id: '00000000-0000-0000-0000-000000000001',
            professional_id: professional.id,
            skill_name: 'React Native',
            category: 'Mobile Development',
            proficiency_level: 'expert',
            years_of_experience: 4,
            description: 'Desenvolvimento de apps mobile cross-platform com React Native.',
            endorsements: 15,
        },
    });

    const expertise2 = await prisma.expertise.upsert({
        where: { id: '00000000-0000-0000-0000-000000000002' },
        update: {},
        create: {
            id: '00000000-0000-0000-0000-000000000002',
            professional_id: professional.id,
            skill_name: 'Node.js / TypeScript',
            category: 'Backend Development',
            proficiency_level: 'expert',
            years_of_experience: 5,
            description: 'Desenvolvimento de APIs RESTful e GraphQL com Node.js e TypeScript.',
            endorsements: 22,
        },
    });

    console.log(`  ✅ ${expertise1.skill_name}`);
    console.log(`  ✅ ${expertise2.skill_name}`);

    // ============================================================
    // SERVICES
    // ============================================================
    console.log('\n🛠️  Criando serviços...');

    const serviceWeb = await prisma.service.upsert({
        where: { slug: 'desenvolvimento-web' },
        update: {},
        create: {
            name: 'Desenvolvimento Web',
            slug: 'desenvolvimento-web',
            description: 'Criação de sites e aplicações web responsivas e modernas.',
            icon: '💻',
            category: 'Desenvolvimento',
            subcategory: 'Web',
            estimated_duration: '2-8 semanas',
            base_price: 1500.00,
            is_custom_price: true,
            technologies: JSON.stringify(['React', 'Next.js', 'Node.js', 'TypeScript', 'PostgreSQL']),
            deliverables: JSON.stringify(['Código-fonte', 'Documentação', 'Deploy em produção', 'Manual do usuário']),
            is_active: true,
        },
    });

    const serviceMobile = await prisma.service.upsert({
        where: { slug: 'desenvolvimento-mobile' },
        update: {},
        create: {
            name: 'Desenvolvimento Mobile',
            slug: 'desenvolvimento-mobile',
            description: 'Criação de aplicativos iOS e Android com React Native.',
            icon: '📱',
            category: 'Desenvolvimento',
            subcategory: 'Mobile',
            estimated_duration: '4-12 semanas',
            base_price: 2500.00,
            is_custom_price: true,
            technologies: JSON.stringify(['React Native', 'Expo', 'TypeScript', 'Node.js']),
            deliverables: JSON.stringify(['Código-fonte', 'App publicado nas lojas', 'Documentação']),
            is_active: true,
        },
    });

    console.log(`  ✅ ${serviceWeb.name}`);
    console.log(`  ✅ ${serviceMobile.name}`);

    // ============================================================
    // EVENT
    // ============================================================
    console.log('\n📅 Criando evento...');

    const event = await prisma.event.upsert({
        where: { id: '00000000-0000-0000-0000-000000000010' },
        update: {},
        create: {
            id: '00000000-0000-0000-0000-000000000010',
            title: 'LADS Tech Week 2026',
            description: 'A semana tecnológica do LADS traz palestras, workshops e hackathon para toda a comunidade UFMG. Venha aprender, conectar-se e inovar!',
            short_description: 'Palestras, workshops e hackathon do LADS.',
            start_date: new Date('2026-04-14T09:00:00'),
            end_date: new Date('2026-04-18T18:00:00'),
            registration_start: new Date('2026-03-10T00:00:00'),
            registration_deadline: new Date('2026-04-13T23:59:00'),
            location: 'Departamento de Ciência da Computação - UFMG, Belo Horizonte, MG',
            is_online: false,
            event_type: 'semana_academica',
            category: 'Tecnologia',
            max_participants: 200,
            current_participants: 0,
            organizer_id: adminUser.id,
            co_organizers: JSON.stringify([professionalUser.id]),
            status: 'published',
            visibility: 'public',
            tags: JSON.stringify(['tecnologia', 'programação', 'hackathon', 'UFMG', 'LADS']),
            agenda: JSON.stringify([
                { day: 1, date: '14/04', activities: ['Abertura oficial', 'Palestra: IA no futuro', 'Workshop React Native'] },
                { day: 2, date: '15/04', activities: ['Workshop Node.js', 'Palestra: DevOps na prática'] },
                { day: 3, date: '16/04', activities: ['Início do Hackathon', 'Mentoria com profissionais'] },
                { day: 4, date: '17/04', activities: ['Hackathon - dia 2', 'Apresentações dos projetos'] },
                { day: 5, date: '18/04', activities: ['Premiação Hackathon', 'Encerramento e networking'] },
            ]),
            requirements: 'Trazer notebook. Noções básicas de programação são recomendadas.',
        },
    });

    console.log(`  ✅ ${event.title}`);

    // ============================================================
    // EVENT PARTICIPANT
    // ============================================================
    console.log('\n🎟️  Registrando participante...');

    await prisma.eventParticipant.upsert({
        where: {
            event_id_user_id: {
                event_id: event.id,
                user_id: studentUser.id,
            },
        },
        update: {},
        create: {
            event_id: event.id,
            user_id: studentUser.id,
            registration_status: 'confirmed',
            confirmed_at: new Date(),
        },
    });

    console.log(`  ✅ ${studentUser.first_name} registrada no evento`);

    // ============================================================
    // FORUM
    // ============================================================
    console.log('\n💬 Criando fórum do evento...');

    const forum = await prisma.forum.upsert({
        where: { event_id: event.id },
        update: {},
        create: {
            event_id: event.id,
            title: 'Fórum - LADS Tech Week 2026',
            description: 'Espaço para discussões, dúvidas e networking dos participantes da LADS Tech Week 2026.',
            is_moderated: true,
            moderator_ids: JSON.stringify([adminUser.id]),
        },
    });

    console.log(`  ✅ ${forum.title}`);

    // ============================================================
    // TOPIC
    // ============================================================
    console.log('\n📝 Criando tópico no fórum...');

    const topic = await prisma.topic.upsert({
        where: { id: '00000000-0000-0000-0000-000000000020' },
        update: {},
        create: {
            id: '00000000-0000-0000-0000-000000000020',
            forum_id: forum.id,
            author_id: studentUser.id,
            title: 'Quais materiais são recomendados para o workshop de React Native?',
            content: 'Olá! Estou animada para o workshop de React Native. Alguém pode recomendar algum material de estudo prévio para aproveitar melhor?',
            category: 'Workshops',
            is_pinned: false,
        },
    });

    console.log(`  ✅ Tópico: "${topic.title.substring(0, 50)}..."`);

    // ============================================================
    // COMMENT
    // ============================================================
    console.log('\n💭 Adicionando comentário no tópico...');

    await prisma.comment.upsert({
        where: { id: '00000000-0000-0000-0000-000000000030' },
        update: {},
        create: {
            id: '00000000-0000-0000-0000-000000000030',
            topic_id: topic.id,
            author_id: professionalUser.id,
            content: 'Oi Maria! Recomendo a documentação oficial do React Native (reactnative.dev) e o curso gratuito da Rocketseat. O workshop vai partir do básico, mas quem já tiver alguma base em JavaScript vai aproveitar muito mais! 🚀',
        },
    });

    console.log('  ✅ Comentário adicionado pelo profissional');

    // ============================================================
    // RESUMO
    // ============================================================
    console.log('\n✨ Seed concluído com sucesso!\n');
    console.log('📊 Resumo do que foi criado:');
    console.log('  - 3 usuários (admin, profissional, estudante)');
    console.log('  - 1 perfil profissional com 2 áreas de expertise');
    console.log('  - 2 serviços (Desenvolvimento Web e Mobile)');
    console.log('  - 1 evento (LADS Tech Week 2026)');
    console.log('  - 1 participante registrado no evento');
    console.log('  - 1 fórum vinculado ao evento');
    console.log('  - 1 tópico com 1 comentário no fórum');
    console.log('\n🔐 Credenciais de acesso (ambiente de desenvolvimento):');
    console.log('  Admin:       admin@lads.com        / admin123');
    console.log('  Profissional: joao.silva@lads.com  / joao123');
    console.log('  Estudante:   maria.costa@aluno.ufmg.br / maria123');
}

main()
    .catch((e) => {
        console.error('❌ Erro durante o seed:', e);
        process.exit(1);
    })
    .finally(async () => {
        await prisma.$disconnect();
    });
