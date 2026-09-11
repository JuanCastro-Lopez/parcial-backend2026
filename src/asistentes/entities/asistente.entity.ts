import {
  Column,
  Entity,
  ManyToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { Evento } from '../../eventos/entities/evento.entity';

@Entity('asistentes')
export class Asistente {
  @PrimaryGeneratedColumn()
  id!: number;

  @Column({ type: 'varchar', length: 255 })
  nombreCompleto!: string;

  @Column({ type: 'varchar', length: 255 })
  correo!: string;

  @Column({ type: 'varchar', length: 50, nullable: true })
  telefono!: string | null;

  @Column({ type: 'varchar', length: 50, unique: true })
  codigoTicket!: string;

  @ManyToOne(() => Evento, (evento) => evento.asistentes, {
    onDelete: 'CASCADE',
  })
  evento!: Evento;
}
