'use client';

import Link from 'next/link';
import { motion } from 'framer-motion';
import { Car, Shield, Clock, Users, ArrowRight } from 'lucide-react';
import GlassCard from '../../components/GlassCard';

export default function Home() {
  const container = {
    hidden: { opacity: 0 },
    show: {
      opacity: 1,
      transition: {
        staggerChildren: 0.1
      }
    }
  };

  const item = {
    hidden: { y: 20, opacity: 0 },
    show: { y: 0, opacity: 1 }
  };

  return (
    <div className="container" style={{ paddingBottom: '80px' }}>
      {/* Hero Section */}
      <section style={{ 
        minHeight: '80vh', 
        display: 'flex', 
        flexDirection: 'column', 
        justifyContent: 'center', 
        alignItems: 'center', 
        textAlign: 'center',
        padding: '100px 0' 
      }}>
        <motion.div
          initial={{ scale: 0.9, opacity: 0 }}
          animate={{ scale: 1, opacity: 1 }}
          transition={{ duration: 0.5 }}
        >
          <h1 style={{ fontSize: '72px', marginBottom: '24px', lineHeight: '1.1' }}>
            Ride Smarter at <br />
            <span className="gradient-text">GIKI Campus</span>
          </h1>
          <p style={{ 
            fontSize: '20px', 
            color: 'var(--text-muted)', 
            maxWidth: '600px', 
            margin: '0 auto 40px auto',
            lineHeight: '1.6'
          }}>
            The safest and most efficient way for Gikians to share rides. 
            Connect with fellow students and faculty for a better commute.
          </p>
          <div style={{ display: 'flex', gap: '16px', justifyContent: 'center' }}>
            <Link href="/map" className="btn-primary" style={{ padding: '16px 32px', fontSize: '18px' }}>
              Book a Ride <ArrowRight size={20} />
            </Link>
            <Link href="/login" style={{ 
              padding: '16px 32px', 
              fontSize: '18px', 
              color: 'var(--text)', 
              textDecoration: 'none',
              fontWeight: '600',
              border: '1px solid var(--surface-border)',
              borderRadius: '12px',
              background: 'var(--glass)'
            }}>
              Sign In
            </Link>
          </div>
        </motion.div>
      </section>

      {/* Features Section */}
      <motion.section 
        variants={container}
        initial="hidden"
        whileInView="show"
        viewport={{ once: true }}
        style={{ 
          display: 'grid', 
          gridTemplateColumns: 'repeat(auto-fit, minmax(250px, 1fr))', 
          gap: '24px',
          marginTop: '40px'
        }}
      >
        <motion.div variants={item}>
          <GlassCard style={{ height: '100%' }}>
            <div style={{ background: 'rgba(99, 102, 241, 0.1)', padding: '12px', borderRadius: '12px', width: 'fit-content', marginBottom: '20px' }}>
              <Shield color="var(--primary)" size={28} />
            </div>
            <h3>Secure Rides</h3>
            <p style={{ color: 'var(--text-muted)', marginTop: '12px', lineHeight: '1.5' }}>
              Exclusive for GIKI students and staff. All users are verified through university emails.
            </p>
          </GlassCard>
        </motion.div>

        <motion.div variants={item}>
          <GlassCard style={{ height: '100%' }}>
            <div style={{ background: 'rgba(168, 85, 247, 0.1)', padding: '12px', borderRadius: '12px', width: 'fit-content', marginBottom: '20px' }}>
              <Clock color="var(--secondary)" size={28} />
            </div>
            <h3>Save Time</h3>
            <p style={{ color: 'var(--text-muted)', marginTop: '12px', lineHeight: '1.5' }}>
              Real-time tracking and instant matching with drivers headed your way.
            </p>
          </GlassCard>
        </motion.div>

        <motion.div variants={item}>
          <GlassCard style={{ height: '100%' }}>
            <div style={{ background: 'rgba(244, 63, 94, 0.1)', padding: '12px', borderRadius: '12px', width: 'fit-content', marginBottom: '20px' }}>
              <Users color="var(--accent)" size={28} />
            </div>
            <h3>Community</h3>
            <p style={{ color: 'var(--text-muted)', marginTop: '12px', lineHeight: '1.5' }}>
              Meet new people across campus while reducing the carbon footprint.
            </p>
          </GlassCard>
        </motion.div>
      </motion.section>
    </div>
  );
}
